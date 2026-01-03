TARGET			:= foobar

CSRCS			:= $(TARGET).c

CFLAGS			:= -pg -pthread

include ../../prj_native.mk

UFTRACE_DATA		:= uftrace.data

$(UFTRACE_DATA): $(ELF_FILE)
	uftrace --no-pager record $<

uftrace_record_1: $(UFTRACE_DATA)

uftrace_replay_1: $(UFTRACE_DATA)
	uftrace --no-pager replay

uftrace_replay_2: $(UFTRACE_DATA)
	uftrace --no-pager replay --column-view

uftrace_report_1: $(UFTRACE_DATA)
	uftrace --no-pager report

uftrace_report_2: $(UFTRACE_DATA)
	uftrace --no-pager report -s self

uftrace_report_3: $(UFTRACE_DATA)
	uftrace --no-pager report --avg-self

uftrace_graph_1: $(UFTRACE_DATA)
	uftrace --no-pager graph foo

uftrace_graph_2: $(UFTRACE_DATA)
	uftrace --no-pager graph

uftrace_info_1: $(UFTRACE_DATA)
	uftrace --no-pager info

uftrace_clean:
	rm -rf $(UFTRACE_DATA)*

clean: uftrace_clean

.PHONY: uftrace_record_1
.PHONY: uftrace_replay_1
.PHONY: uftrace_replay_2
.PHONY: uftrace_report_1
.PHONY: uftrace_report_2
.PHONY: uftrace_report_3
.PHONY: uftrace_graph_1
.PHONY: uftrace_graph_2
.PHONY: uftrace_info_1
