package main
import (
	"os"
	"os/exec"
	"fmt"
	"sync"
	"path/filepath"
	"strings"
//	glob "github.com/gobwas/glob"
)
var (
	wg sync.WaitGroup
//	g glob.Glob

	dirPath string = "../thrift"
	genLang string    = "go"

	candidate = []string{}
)
func matcher(filename string) bool {
	//return g.Match(filename)
	filename = strings.ToLower(filename)
	if strings.HasSuffix(filename, "service.thrift") || strings.HasSuffix(filename, "svc.thrift") {
		return true
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
	return exec.Command("thrift", "-r", "--gen", genLang, path)
}
func main() {
	if !(len(os.Args) >= 2) {
		os.Args = append(os.Args, dirPath)
	}
	for _, arg := range os.Args[1:] {
		if strings.HasPrefix(arg, "-h") || strings.HasPrefix(arg, "--help") {
			fmt.Printf(`Help:
  --gen <lang>    thrift generate language
  -h, --help      show help

thrift_builder_tool`)
			return
		}
	}
	var onWatchLang = false
	for _, arg := range os.Args[1:] {
		if strings.HasPrefix(arg, "--gen") {
			if splitted := strings.Split(arg, "="); len(splitted) == 2 {
				genLang = splitted[1]
				break
			}else{
				onWatchLang = true
				continue
			}
		}else if !onWatchLang && arg != os.Args[0] {
			dirPath = arg
		}
		if onWatchLang {
			genLang = arg
		}
	}
	if len(dirPath) == 0 {
		fmt.Println("err: dir path source cannot be empty")
		os.Exit(2)
	}
//	g = glob.MustCompile("*service.thrift")
	fmt.Printf("Output language: %q\n", genLang)
	fmt.Printf("Dir source path: %q\n", dirPath)
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