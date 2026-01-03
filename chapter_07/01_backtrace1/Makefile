TARGET			:= backtrace1

CSRCS			:= $(TARGET).c
CSRCS			+= backtrace_main1.c

CFLAGS			:= -rdynamic

include ../../prj_native.mk

backtrace: $(ELF_FILE)
	@$< $(TEST_FLAGS)

