#!/bin/sh

export CC=$OHOS_NDK_HOME/native/llvm/bin/clang \
export CXX=$OHOS_NDK_HOME/native/llvm/bin/clang++ \
export AR=$OHOS_NDK_HOME/native/llvm/bin/llvm-ar \
export AS=$OHOS_NDK_HOME/native/llvm/bin/llvm-as \
export LD=$OHOS_NDK_HOME/native/llvm/bin/ld.lld \
export STRIP=$OHOS_NDK_HOME/native/llvm/bin/llvm-strip \
export RANLIB=$OHOS_NDK_HOME/native/llvm/bin/llvm-ranlib \
export OBJDUMP=$OHOS_NDK_HOME/native/llvm/bin/llvm-objdump \
export OBJCOPY=$OHOS_NDK_HOME/native/llvm/bin/llvm-objcopy \
export NM=$OHOS_NDK_HOME/native/llvm/bin/llvm-nm \
export CFLAGS="-target arm-linux-ohos --sysroot=${OHOS_NDK_HOME}/native/sysroot -D__MUSL__ -march=armv7-a -mfloat-abi=softfp -mtune=generic-armv7-a -mthumb" \
export CXXFLAGS="-target arm-linux-ohos --sysroot=${OHOS_NDK_HOME}/native/sysroot -D__MUSL__ -march=armv7-a -mfloat-abi=softfp -mtune=generic-armv7-a -mthumb" \


export GOARCH=arm
export GOOS=android
export CGO_ENABLED=1
export LLVMCONFIG=$OHOS_NDK_HOME/native/llvm/bin/llvm-config
export CGO_CFLAGS="-I${PWD}/include -Wno-atomic-alignment -g -O2 `$LLVMCONFIG --cflags` --target=arm-linux-ohos --sysroot=$OHOS_NDK_HOME/native/sysroot"
export CGO_LDFLAGS="--target=arm-linux-ohos -fuse-ld=lld -L${PWD}/dist/armeabi-v7a"