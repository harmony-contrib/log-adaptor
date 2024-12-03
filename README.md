# log-adaptor

This is a log library for OpenHarmony, that we can use it to replace with `android/log` for Golang.

## Usage

1. Clone or fork this project.

2. Add flags in your build command for Golang.

   ```bash
   export CGO_CFLAGS="-I/path/to/include"
   export CGO_LDFLAGS="-L/path/to/dist/${ARCH}"
   ```

3. Copy `dist/${ARCH}/liblog.so` and add to your ohos project.
4. Enjoy it.

## Key points

1. The dynamic link library constructed by Golang might lack `SONAME`, potentially leading to a failure in the final loading process, youou can rectify this issue using the following code:

   ```CMakeLists.txt
   add_library(gotest SHARED IMPORTED)
   # set IMPORTED_NO_SONAME to true
   set_target_properties(gotest PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../../../libs/${OHOS_ARCH}/libhello.so IMPORTED_NO_SONAME TRUE)

   target_link_libraries(entry PUBLIC libace_napi.z.so node_addon_api_ohos GmSSL gotest)
   ```

   Alternatively, you can forcibly specify the soname in the build output to circumvent this issue.

2. The Golang interface should be invoked within a sub-thread; otherwise, initialization will fail.
