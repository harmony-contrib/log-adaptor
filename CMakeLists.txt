cmake_minimum_required(VERSION 3.15)

include($ENV{OHOS_NDK_HOME}/native/build/cmake/ohos.toolchain.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(log)

add_library(log SHARED ${CMAKE_SOURCE_DIR}/log.c) 

target_link_libraries(log PUBLIC libhilog_ndk.z.so)