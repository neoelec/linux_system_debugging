#include <stdio.h>

struct frame {
    struct frame *fp;
    void *ip;
};

struct frame *getFRAME(long dummy)
{
    void **ptr = (void *)(&dummy + 3);
    return *ptr;
}

void print_walk_through(void)
{
    long dummy = 10;
    struct frame *frame = getFRAME(dummy);
    size_t i = 0;

    printf("Stack backtrace:\n");
    while ((unsigned long)frame & (~0x7)) {
        printf("%03zu : [ip=%p]\n", i++, frame->ip);
        frame = frame->fp;
    }
}
