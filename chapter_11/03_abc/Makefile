TARGET			:= abc

CSRCS			:= $(TARGET).c

CFLAGS			:= -pg

include ../../prj_native.mk

tc1: $(OUTPUT)
	uftrace --no-pager $(OUTPUT)

tc2: $(OUTPUT)
	uftrace --no-pager -F a $(OUTPUT)

tc3: $(OUTPUT)
	uftrace --no-pager -N c $(OUTPUT)

tc4: $(OUTPUT)
	uftrace --no-pager -N ^get $(OUTPUT)

tc5: $(OUTPUT)
	uftrace --no-pager -F ^get $(OUTPUT)

tc6: $(OUTPUT)
	uftrace --no-pager -D 1 $(OUTPUT)

tc7: $(OUTPUT)
	uftrace --no-pager -D 3 $(OUTPUT)

tc8: $(OUTPUT)
	uftrace --no-pager -R a@retval $(OUTPUT)

tc9: $(OUTPUT)
	uftrace --no-pager -A main@arg1,arg2 $(OUTPUT)

tc10: $(OUTPUT)
	uftrace --no-pager -T a@depth=1 $(OUTPUT)

tc11: $(OUTPUT)
	uftrace --no-pager -T a@depth=2 $(OUTPUT)

tc12: $(OUTPUT)
	uftrace --no-pager -T a@time=10us $(OUTPUT)

tc13: $(OUTPUT)
	uftrace --no-pager -T a@time=15us $(OUTPUT)

tc14: $(OUTPUT)
	uftrace --no-pager -T getpid@trace-off $(OUTPUT)

tc15: $(OUTPUT)
	uftrace --no-pager --disable -T getpid@trace-on $(OUTPUT)

tc16: $(OUTPUT)
	uftrace --no-pager -T getpid@color=red $(OUTPUT)

.PHONY: tc1 tc2 tc3 tc4 tc5 tc6 tc7 tc8 tc9 tc10
.PHONY: tc11 tc12 tc13 tc14 tc15 tc16
