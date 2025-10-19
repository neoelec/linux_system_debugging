#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>

void print_gnu_backtrace(void)
{
    void *frame_addrs[16];
    char **frame_strings;
    size_t backtrace_size;
    size_t i;

    backtrace_size = backtrace(frame_addrs, 16);
    frame_strings = backtrace_symbols(frame_addrs, backtrace_size);

    printf("Stack backtrace:\n");

    for (i = 0; i < backtrace_size; ++i) {
        printf("%03zu : %s\n", i, frame_strings[i]);
    }

    free(frame_strings);
}
