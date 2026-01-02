#include <stdio.h>

struct frame {
    struct frame *fp;
    void *ip;
};

void print_walk_through(void)
{
    struct frame *frame;
    size_t i = 0;

    __asm__ volatile("mov     %%rbp,%0" : "=r"(frame));

    printf("Stack backtrace:\n");

    while ((unsigned long)frame & (~0x7)) {
        printf("%03zu : [ip=%p]\n", i++, frame->ip);
        frame = frame->fp;
    }
}
