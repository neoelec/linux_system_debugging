TARGET			:= backtrace5

CSRCS			:= $(TARGET).c
CSRCS			+= backtrace_main5.c

LDFLAGS			:= -lunwind
LDFLAGS			+= -lunwind-$(shell uname -m)

include ../../prj_native.mk
