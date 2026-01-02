#include <stdio.h>

extern char __executable_start;

struct frame {
    struct frame *fp;
    void *ip;
};

void print_walk_through(void)
{
    struct frame *frame;
    size_t i = 0;

    __asm__ volatile("mov     %0,fp" : "=r"(frame));

    printf("Stack backtrace:\n");

    while (frame < frame->fp && frame->ip > (void *)&__executable_start) {
        printf("%03zu : [ip=%p]\n", i++, frame->ip);
        frame = frame->fp;
    }
}
