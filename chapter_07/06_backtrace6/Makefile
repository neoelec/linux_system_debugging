TARGET			:= backtrace6

CSRCS			:= $(TARGET).c
CSRCS			+= backtrace_main6.c

LDFLAGS			:= -lunwind
LDFLAGS			+= -lunwind-$(shell uname -m | sed -e 's/riscv64/riscv/')

include ../../prj_native.mk

backtrace: $(ELF_FILE)
	@$< $(TEST_FLAGS)
