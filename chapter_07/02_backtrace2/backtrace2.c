#include <stdio.h>

extern char __executable_start;

struct frame {
    struct frame *fp;
    void *ip;
};

void print_gnu2_backtrace(void)
{
    struct frame *frame;
    size_t i = 0;

    frame = __builtin_frame_address(0);

    printf("Stack backtrace:\n");

    while (frame < frame->fp && frame->ip > (void *)&__executable_start) {
        printf("%03zu : [ip=%p]\n", i++, frame->ip);
        frame = frame->fp;
    }
}
