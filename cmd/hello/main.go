package main

import (
	"fmt"
	"os"
	"strings"
)

var version = "HEAD"

func main() {
	if len(os.Args) > 1 {
		message := strings.Join(os.Args[1:], " ")
		fmt.Printf("hello world %s (%s)", message, version)
	} else {
		fmt.Printf("hello world (%s)\n", version)
	}
}
