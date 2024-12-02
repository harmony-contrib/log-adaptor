#!/bin/sh

# get current bash path
SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd)

ROOT_PATH=$(dirname "$SCRIPT_PATH")

rm -rf $ROOT_PATH/dist

build() {
    local arch=$1;

    rm -rf build
    mkdir build
    
    pushd build
    cmake -DOHOS_STL=c++_shared -DOHOS_ARCH=${arch}  ..
    cmake --build . --config Release

    mkdir -p $ROOT_PATH/dist/${arch}
    cp liblog.so $ROOT_PATH/dist/${arch}
    popd
}

build "arm64-v8a"
build "armeabi-v7a"
build "x86_64"