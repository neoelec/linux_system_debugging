TARGET			:= backtrace4

CSRCS			:= $(TARGET).c
CSRCS			+= backtrace_main4.c

CFLAGS			:= -fno-omit-frame-pointer
CFLAGS			+= -rdynamic

LDFLAGS			:= -ldl

include ../../prj_native.mk
