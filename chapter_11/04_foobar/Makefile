TARGET			:= foobar

CSRCS			:= $(TARGET).c

CFLAGS			:= -pg -pthread

include ../../prj_native.mk

record: $(OUTPUT)
	uftrace --no-pager record $(OUTPUT)

replay1: $(OUTPUT)
	uftrace --no-pager replay

replay2: $(OUTPUT)
	uftrace --no-pager replay --column-view

report1: $(OUTPUT)
	uftrace --no-pager report

report2: $(OUTPUT)
	uftrace --no-pager report -s self

report3: $(OUTPUT)
	uftrace --no-pager report --avg-self

graph_1: $(OUTPUT)
	uftrace --no-pager graph foo

graph_2: $(OUTPUT)
	uftrace --no-pager graph

info: $(OUTPUT)
	uftrace --no-pager info

.PHONY: record
.PHONY: replay1 replay2
.PHONY: report1 report2 report3
.PHONY: graph_1 graph_2
.PHONY: info
