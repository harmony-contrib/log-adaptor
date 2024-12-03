#include <stdarg.h>
#include <stdio.h>
#include "hilog/log.h"

int __android_log_vprint(int prio, const char *tag, const char *fmt, va_list ap) { 
    char buffer[4096]; 
    vsnprintf(buffer, sizeof(buffer), fmt, ap); 
    OH_LOG_FATAL(LOG_APP, "[%{public}s] %{public}s", tag, buffer); 
    return 0; 
}