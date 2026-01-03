all: 
	@echo

uftrace_record_1:
	uftrace --no-pager record $(shell which pwd)

uftrace_record_2:
	uftrace --no-pager record --force $(shell which pwd)

uftrace_replay_1:
	uftrace --no-pager replay

clean:
	@echo

.PHONY: all
.PHONY: uftrace_record_1
.PHONY: uftrace_record_2
.PHONY: uftrace_replay_1
