TARGET_COMM		?= hello1
TARGET_PID		:= $(shell ps -ef | grep -E "\b$(TARGET_COMM)\b" | sed -e '/grep/d' | awk '{print $$2}')

ptrace: $(OUTPUT)
	@if [ -z "$(TARGET_PID)" ]; then \
		echo "[\033[31mFAIL\033[0m] run $(TARGET_COMM) before testing..."; \
		exit; \
	else \
		sudo $(OUTPUT) $(TARGET_PID) $(TARGET_ADDR); \
	fi

kill:
	@if [ -n "$(TARGET_PID)" ]; then kill -9 $(TARGET_PID); fi

.PHONY: ptrace
