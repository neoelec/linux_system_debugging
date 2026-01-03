TARGET			:= abc

CSRCS			:= $(TARGET).c

CFLAGS			:= -pg

include ../../prj_native.mk

uftrace: $(ELF_FILE)
	uftrace --no-pager $<

uftrace_function_1: $(ELF_FILE)
	uftrace --no-pager -F a $<

uftrace_notrace_1: $(ELF_FILE)
	uftrace --no-pager -N c $<

uftrace_function_regex_1: $(ELF_FILE)
	uftrace --no-pager -N ^get $<

uftrace_notrace_regex_1: $(ELF_FILE)
	uftrace --no-pager -F ^get $<

uftrace_depth_1: $(ELF_FILE)
	uftrace --no-pager -D 1 $<

uftrace_depth_2: $(ELF_FILE)
	uftrace --no-pager -D 3 $<

uftrace_retval_1: $(ELF_FILE)
	uftrace --no-pager -R a@retval $<

uftrace_argument_1: $(ELF_FILE)
	uftrace --no-pager -A main@arg1,arg2 $<

uftrace_trigger_1: $(ELF_FILE)
	uftrace --no-pager -T a@depth=1 $<

uftrace_trigger_2: $(ELF_FILE)
	uftrace --no-pager -T a@depth=2 $<

uftrace_trigger_3: $(ELF_FILE)
	uftrace --no-pager -T a@time=10us $<

uftrace_trigger_4: $(ELF_FILE)
	uftrace --no-pager -T a@time=15us $<

uftrace_trigger_5: $(ELF_FILE)
	uftrace --no-pager -T getpid@trace-off $<

uftrace_trigger_6: $(ELF_FILE)
	uftrace --no-pager --disable -T getpid@trace-on $<

uftrace_trigger_7: $(ELF_FILE)
	uftrace --no-pager -T getpid@color=red $<

.PHONY: uftrace_function_1
.PHONY: uftrace_notrace_1
.PHONY: uftrace_function_regex_1
.PHONY: uftrace_notrace_regex_1
.PHONY: uftrace_depth_1
.PHONY: uftrace_depth_2
.PHONY: uftrace_retval_1
.PHONY: uftrace_argument_1
.PHONY: uftrace_trigger_1
.PHONY: uftrace_trigger_2
.PHONY: uftrace_trigger_3
.PHONY: uftrace_trigger_4
.PHONY: uftrace_trigger_5
.PHONY: uftrace_trigger_6
.PHONY: uftrace_trigger_7
