TARGET			:= hello

CSRCS			:= $(TARGET).c

CFLAGS			:= -pg

include ../../prj_native.mk

uftrace: $(ELF_FILE)
	uftrace --no-pager $<

uftrace_kernel_tracing_1: $(ELF_FILE)
	sudo uftrace --no-pager -k $<

uftrace_kernel_tracing_2: $(ELF_FILE)
	sudo uftrace --no-pager -k -F *write@kernel $<

uftrace_kernel_tracing_3: $(ELF_FILE)
	sudo uftrace --no-pager -K 2 -F *write@kernel $<

uftrace_preload_1: $(OUTPUT)
	LD_PRELOAD=../05_preload/bin/$(HOST_ARCH)/preload.so.0.0.0 $<

.PHONY: uftrace
.PHONY: uftrace_kernel_tracing_1
.PHONY: uftrace_kernel_tracing_2
.PHONY: uftrace_kernel_tracing_3
.PHONY: uftrace_preload_1
