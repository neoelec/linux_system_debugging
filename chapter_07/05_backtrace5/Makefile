TARGET			:= backtrace5

CSRCS			:= $(TARGET).c
CSRCS			+= backtrace_main5.c

LDFLAGS			:= -lunwind
LDFLAGS			+= -lunwind-$(shell uname -m | sed -e 's/riscv64/riscv/')

include ../../prj_native.mk
