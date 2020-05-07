package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"strconv"
	"sync"
	"time"
)

type FuncTest struct {
	ApiPath string   `json:"_endpoint"`
	Name    []string `json:"names"`
}

type ResultTest struct {
	ApiPath    string            `json:"_endpoint"`
	Took       string            `json:"_took"`
	Timestamp  int64             `json:"_timestamp"`
	Qualified  map[string]string `json:"_resp_matched_with_criteria"`
	Response   map[string]string `json:"responses"`
}

var (
	testCounted = 0
	mx          sync.Mutex
	Dataset     = FuncTest{}
	Resp        = ResultTest{"", "0", 0, map[string]string{}, map[string]string{}}
	hdr         = map[string][]string{
		"X-Line-Application": {"IOS\t8.2.4\tiOS\t10.2"},
		"X-Line-Access":      {"abcjdedededd"},
		"User-Agent":         {"LI/7.150 iPad6,3 10.2"},
		"Accept":             {"application/x-thrift"},
		"Content-Type":       {"application/x-thrift"},
	}
	invalidMethodName    = []byte{73, 110, 118, 97, 108, 105, 100, 32, 109, 101, 116, 104, 111, 100, 32, 110, 97, 109, 101, 58}
	authenticationFailed = []byte{65, 117, 116, 104, 101, 110, 116, 105, 99, 97, 116, 105, 111, 110, 32, 70, 97, 105, 108, 101, 100, 46}
	TApplicationError    = []byte{97, 0} // \x82a\x00 or \x92a\x00
	TProcessingError     = []byte{65, 0} // \x82A\x00 or \x92A\x00
)

// qualified rpc name criteria
func criteria(resp *http.Response, body []byte) bool {
	if bytes.Contains(body, authenticationFailed) {
		return true
	}
	if len(body) > 3 && !bytes.Contains(body[:3], TApplicationError) && bytes.Contains(body[:3], TProcessingError) {
		return true
	}
	return false
}

func Requester(id int, ch chan string, done chan int) {
	cl := &http.Client{}
	//fmt.Printf("Requester%d running...\n", id)
	for {
		job := <-ch
		data := []byte{130, 33, 0, byte(len(job))}
		ex := []byte(job)
		data = append(data, ex...)
		data = append(data, byte(0))
		req, _ := http.NewRequest("POST", Dataset.ApiPath, bytes.NewReader(data))
		req.Header = hdr
		a := time.Now()
		o, e := cl.Do(req)
		b := time.Now().Sub(a)
		if e != nil {
			panic(e)
		}
		readAll, err := ioutil.ReadAll(o.Body)
		io.Copy(ioutil.Discard, o.Body)
		o.Body.Close()
		if err != nil {
			panic(err)
		}
		//fmt.Printf("%#+v %#+v\n", o, data)
		mx.Lock()
		if bytes.Contains(readAll, invalidMethodName) {
			Resp.Response[job] = "(" + o.Proto + " " + o.Status + ") " + "invalid method name"
		} else if bytes.Contains(readAll, authenticationFailed) {
			Resp.Response[job] = "(" + o.Proto + " " + o.Status + ") " + "authentication failed"
		} else {
			Resp.Response[job] = "(" + o.Proto + " " + o.Status + ") " + string(readAll)
		}

		if criteria(o, readAll) {
			Resp.Qualified[job] = b.String()
		}

		testCounted++
		if testCounted >= len(Dataset.Name) {
			Resp.ApiPath = Dataset.ApiPath
			done <- 1
		}
		mx.Unlock()
	}
}

func main() {
	filename := os.Args[1]
	fmt.Println("LINE Thrift 'Compact' Protocol Function testing")
	fmt.Println("-----")
	fmt.Printf("Opening [%s]...\n", filename)

	file, err := os.Open(filename)
	defer file.Close()
	if os.IsNotExist(err) {
		panic("File configuration is not exist.")
	} else if err != nil {
		panic(err)
	}
	decoder := json.NewDecoder(file)
	decoder.Decode(&Dataset)
	//fmt.Printf("%#+v\n", Dataset)

	fmt.Printf("Endpoint %s\n", Dataset.ApiPath)
	fmt.Printf("Testing... [%d] ", len(Dataset.Name))

	if len(Dataset.Name) < 1 {
		panic("names is empty")
	}

	done := make(chan int)
	queue := make(chan string)
	startTime := time.Now()
	for i := 0; i < 60; i++ {
		go Requester(i, queue, done)
	}

	for _, fname := range Dataset.Name {
		queue <- fname
	}
	<-done
	doneTime := time.Now().Sub(startTime)
	fmt.Printf("[%s]\n", doneTime)

	Resp.Took = doneTime.String()

	curMillis := time.Now().Unix()
	Resp.Timestamp = curMillis
	fx := "testing_api-" + strconv.FormatInt(curMillis, 10) + ".json"
	file, err = os.Create(fx)
	defer file.Close()
	if err != nil && !os.IsExist(err) {
		panic(err)
	}
	encoder := json.NewEncoder(file)
	encoder.SetIndent("", "\t")
	encoder.Encode(Resp)
	fmt.Printf("Saved on [%s]\n", fx)
	fmt.Println("Done")
}
