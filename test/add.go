package main

import "C"

//export Add
func Add(a, b int) int {
	println("gotest")
	return a + b
}

func main() {}
