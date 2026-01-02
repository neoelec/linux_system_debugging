TARGET			:= hello

CSRCS			:= $(TARGET).c

CFLAGS			:= -pg

include ../../prj_native.mk

uftrace: $(OUTPUT)
	uftrace --no-pager $(OUTPUT)

tc1: $(OUTPUT)
	uftrace --no-pager -k $(OUTPUT)

tc2: $(OUTPUT)
	uftrace --no-pager -k -F *write@kernel $(OUTPUT)

tc3: $(OUTPUT)
	uftrace --no-pager -K 2 -F *write@kernel $(OUTPUT)

preload: $(OUTPUT)
	LD_PRELOAD=../05_preload/bin_$(HOSTYPE)/preload.so.0.0.0 $(OUTPUT)

.PHONY: tc1 tc2 tc3
.PHONY: utrace preload
