TARGET			:= backtrace4

CSRCS			:= $(TARGET).$(shell uname -m).c
CSRCS			+= backtrace_main4.c

CFLAGS			:= -fno-omit-frame-pointer
CFLAGS			+= -rdynamic

LDFLAGS			:= -ldl

include ../../prj_native.mk

backtrace: $(ELF_FILE)
	@$< $(TEST_FLAGS)

