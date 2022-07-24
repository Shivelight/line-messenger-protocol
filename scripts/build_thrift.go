package main

import (
	"bytes"
	"flag"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"sync"
	"time"
	//	glob "github.com/gobwas/glob"
)

var (
	wg    sync.WaitGroup
	debug = false

	thriftBinaryLocation = "thrift-0.13.0"
	outGenDir            = "../dist"
	dirPath              = "../thrift"

	// go:"package_prefix=github.com/ii64/linego/libgen/,thrift_import=github.com/ii64/linego/lib/thrift"
	genLang = "go"

	candidate = []string{}

	lookingForFilename = []string{"service.thrift", "svc.thrift"}

	lookFilename string

	showErrors  bool
	workerCount = 1
)

func matcher(filename string) bool {
	//return g.Match(filename)
	filename = strings.ToLower(filename)
	for _, v := range lookingForFilename {
		if strings.HasSuffix(filename, v) {
			return true
		}
	}
	return false
}

// jalan jalan
func walkingWalking(dir string) {
	d, err := os.Open(dir)
	if err != nil {
		fmt.Printf("err: failed read: %s\n", err)
		return
	}
	defer d.Close()
	names, err := d.Readdir(-1)
	if err != nil {
		fmt.Printf("err: failed read dir: %s\n", err)
		return
	}
	for _, item := range names {
		if item.IsDir() {
			walkingWalking(filepath.Join(dir, item.Name()))
			continue
		}
		if matcher(item.Name()) {
			path := filepath.Join(dir, item.Name())
			fmt.Printf("found: %s\n", path)
			candidate = append(candidate, path)
		}
	}
}

func thriftCmd(path string) *exec.Cmd {
	var args = []string{"-o", outGenDir, "-r", "--gen", genLang, path}
	if debug {
		fmt.Printf("> %s\n", append([]string{thriftBinaryLocation}, args...))
	}
	return exec.Command(thriftBinaryLocation, args...)
}

func setIfOSEnv(dst *string, envKey string) {
	if dst == nil {
		return
	}
	envValue := os.Getenv(envKey)
	if envValue != "" {
		*dst = envValue
	}
}

func init() {
	setIfOSEnv(&thriftBinaryLocation, "THRIFT_PATH")
	setIfOSEnv(&genLang, "GEN_LANG")

	flag.StringVar(&thriftBinaryLocation, "bin", thriftBinaryLocation, "thrift binary location")
	flag.StringVar(&genLang, "gen", genLang, "thrft generate language")
	flag.StringVar(&outGenDir, "o", outGenDir, "output location for gen-* directory")
	flag.StringVar(&dirPath, "source-dir", dirPath, "thrift file source directory")
	flag.StringVar(&lookFilename, "lookup", strings.Join(lookingForFilename, ","), "thrift service file lookup")
	flag.BoolVar(&showErrors, "errors", false, "show errors at end of process")
	flag.IntVar(&workerCount, "wrk", workerCount, "worker count")
}

func postArgParse() {
	var clean = []string{}
	if lookFilename != "" {
		spl := strings.Split(lookFilename, ",")
		for _, v := range spl {
			v = strings.Trim(v, " ")
			if v != "" {
				clean = append(clean, v)
			}
		}
	}
	if len(clean) > 0 {
		lookingForFilename = clean
	}
	if len(dirPath) == 0 {
		fmt.Println("err: dir path source cannot be empty")
		os.Exit(2)
	}
}

type metaCU struct {
	Err  error
	Path string
	Done bool
}
type mon struct {
	max   int
	finsh int
	m     []*metaCU
	mu    *sync.Mutex
}

func (m *mon) show(wg *sync.WaitGroup) {
	defer wg.Done()

	buf := bytes.NewBuffer([]byte{})
	i := 0
	max := 0
	pb := [...]rune{'|', '/', '-', '\\'}
	_ = pb
	var rEdge bool
	for {
		m.mu.Lock()

		buf.Reset()
		buf.WriteRune('\r')

		fmt.Fprintf(buf, "[%d/%d] ", m.finsh, m.max)

		if rEdge {
			buf.WriteString(fmt.Sprintf("All processed."))
		} else if len(m.m) > 0 {
		sw_start:
			l := len(m.m)
			if l <= 0 {
				goto sw_out
			}
			idx := (i / (l * 50)) % l
			meta := m.m[idx]
			if !meta.Done {
				fmt.Fprintf(buf, "working: %s ...", meta.Path)
			} else {
				m.m = append(m.m[:idx], m.m[idx+1:]...)
				goto sw_start
			}
		} else {
			buf.WriteString("waiting...")
		}
	sw_out:
		m.mu.Unlock()
		if !rEdge { // active indicator
			buf.WriteRune(' ')
			buf.WriteRune(pb[(i/100)%len(pb)])
		}
		// pad to clear previous written strings
		if l := buf.Len(); l > max {
			max = l
		} else {
			rem := max - l
			sp := make([]byte, rem)
			for i := 0; i < rem; i++ {
				sp[i] = ' '
			}
			buf.Write(sp)
		}
		// buf.WriteRune('\n')
		buf.WriteTo(os.Stdout)
		i++
		time.Sleep(time.Millisecond)
		// edge case.
		if m.finsh >= m.max {
			if !rEdge {
				rEdge = true
			} else {
				fmt.Println()
				break
			}
		}
	}
}

func worker(id int, qpath <-chan string, m *mon, start, done func(meta *metaCU)) {
	var err error
	for {
		var meta metaCU
		meta.Path = <-qpath
		start(&meta)

		cmd := thriftCmd(meta.Path)
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		if err = cmd.Run(); err != nil {
			meta.Err = err
			done(&meta)
			continue
		}
		done(&meta)
	}
}

func main() {
	flag.Parse()
	postArgParse()

	//	g = glob.MustCompile("*service.thrift")
	fmt.Printf("Output language: %q\n", genLang)
	fmt.Printf("Dir source path: %q\n", dirPath)
	fmt.Printf("Dir output path: %q\n", outGenDir)

	os.MkdirAll(outGenDir, 0644)
	_, err := os.Stat(outGenDir)
	if os.IsNotExist(err) {
		fmt.Printf("err: dir out is not present. create it first.")
		os.Exit(2)
	} else if err != nil {
		fmt.Printf("err: dir out error: %s\n", err)
		os.Exit(2)
	}

	fmt.Println("Looking for [*service.thrift]...")
	walkingWalking(dirPath)
	fmt.Printf("total candidate: %d\n", len(candidate))
	if len(candidate) == 0 {
		fmt.Println("nothing to do.")
		return
	}
	fmt.Println("running build....")

	res := []*metaCU{}
	if workerCount > 1 {
		var mu sync.Mutex
		var wg sync.WaitGroup
		m := &mon{
			max: len(candidate),
			mu:  &mu,
		}
		start := func(meta *metaCU) {
			mu.Lock()
			defer mu.Unlock()
			m.m = append(m.m, meta)
		}
		done := func(meta *metaCU) {
			defer wg.Done()
			mu.Lock()
			defer mu.Unlock()

			m.finsh++
			meta.Done = true
			if meta != nil && meta.Err != nil {
				res = append(res, meta)
			}
		}
		bufSz := (((len(candidate) - 1) >> 3) + 1) << 3
		if bufSz > 512 {
			bufSz = 512
		}
		qpath := make(chan string, bufSz)
		for i := 0; i < workerCount; i++ {
			go worker(i, qpath, m, start, done)
		}
		wg.Add(len(candidate))
		wg.Add(1) // show G
		go m.show(&wg)
		for _, path := range candidate {
			qpath <- path
		}
		wg.Wait()
	} else {
		for _, path := range candidate {
			cmd := thriftCmd(path)
			cmd.Stdout = os.Stdout
			cmd.Stderr = os.Stderr
			if err := cmd.Run(); err != nil {
				fmt.Printf("working: %s .... failed :(\n", path)
				res = append(res, &metaCU{err, path, true})
				continue
			}
			fmt.Printf("working: %s .... success\n", path)
		}
	}

	var addt string
	addt = fmt.Sprintf(" %d total", len(candidate))
	if len(res) > 0 {
		if addt != "" {
			addt = "," + addt
		}
		addt = fmt.Sprintf(" %d error(s)%s", len(res), addt)
	}
	fmt.Printf("task done.%s\n", addt)
	if showErrors && len(res) > 0 {
		fmt.Println("errors:")
		for i, err := range res {
			fmt.Printf("[%d] file: %s\n", i, err.Path)
			fmt.Printf("[%d] err:  %s\n", i, err.Err)
		}
	}
}
