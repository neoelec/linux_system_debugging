TARGET			:= perf_test

CSRCS			:= $(TARGET).c

include ../../prj_native.mk

perf: $(OUTPUT)
	perf record $(OUTPUT)
	perf report

clean: clean_perf

clean_perf:
	$(REMOVE) perf.data

.PHONY: perf clean_perf
