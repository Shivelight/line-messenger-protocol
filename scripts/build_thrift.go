package main

import (
	"flag"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"sync"
	//	glob "github.com/gobwas/glob"
)

var (
	wg sync.WaitGroup

	outGenDir = "../dist"
	dirPath   = "../thrift"
	genLang   = "go"

	candidate = []string{}

	lookingForFilename = []string{"service.thrift", "svc.thrift"}
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
	return exec.Command("thrift", "-o", outGenDir, "-r", "--gen", genLang, path)
}
func main() {
	flag.StringVar(&genLang, "gen", genLang, "thrft generate language")
	flag.StringVar(&outGenDir, "o", outGenDir, "output location for gen-* directory")
	flag.StringVar(&dirPath, "source-dir", dirPath, "thrift file source directory")
	var lookFilename string
	flag.StringVar(&lookFilename, "lookup", strings.Join(lookingForFilename, ","), "thrift service file lookup")
	flag.Parse()
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
	for _, path := range candidate {
		cmd := thriftCmd(path)
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		if err := cmd.Run(); err != nil {
			fmt.Printf("working: %s .... failed :(\n", path)
			continue
		}
		fmt.Printf("working: %s .... success\n", path)
	}
	fmt.Println("task done.")
}
