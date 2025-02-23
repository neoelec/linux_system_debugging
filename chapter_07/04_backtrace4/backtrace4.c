#define _GNU_SOURCE
#include <dlfcn.h>
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

void print_walk_through2(void)
{
    long dummy = 10;
    struct frame *frame = getFRAME(dummy);
    Dl_info dlip;
    size_t i = 0;

    printf("Stack backtrace:\n");
    while ((unsigned long)frame & (~0x7)) {
        if (dladdr(frame->ip, &dlip) == 0)
            break;

        printf("%03zu : [fp=%p] [ip=%p] %s\n", i++, frame->fp, frame->ip,
               dlip.dli_sname);

        frame = frame->fp;
    }
}
