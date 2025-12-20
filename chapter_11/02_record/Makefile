all: 
	@echo

record1:
	uftrace --no-pager record $(shell which pwd)

record2:
	uftrace --no-pager record --force $(shell which pwd)

replay:
	uftrace --no-pager replay

clean:
	@echo

.PHONY: all
.PHONY: record1 record2 replay
