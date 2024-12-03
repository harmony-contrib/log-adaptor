#!/bin/sh

build() {
    source ${PWD}/scripts/env/$1.sh

    go build -buildmode=c-shared -v -x -o ${PWD}/test/libhello.so ${PWD}/test/add.go
}

build "arm64-v8a"
# build "armeabi-v7a"
# build "x86_64"