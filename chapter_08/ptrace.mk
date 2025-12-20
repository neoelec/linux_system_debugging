PTRACE_PNAME		?= hello1

ptrace: $(OUTPUT)
	@sudo $(OUTPUT) \
		`ps -ef  | grep $(PTRACE_PNAME) | sed -e '/grep/d' | awk '{print $$2}'`

.PHONY: ptrace
