TARGET			:= backtrace2

CSRCS			:= $(TARGET).c
CSRCS			+= backtrace_main2.c

CFLAGS			:= -fno-omit-frame-pointer

include ../../prj_native.mk

backtrace: $(ELF_FILE)
	@$< $(TEST_FLAGS)

