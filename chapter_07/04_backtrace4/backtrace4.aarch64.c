#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>

struct frame {
    struct frame *fp;
    void *ip;
};

void print_walk_through2(void)
{
    struct frame *frame;
    size_t i = 0;
    Dl_info dlip;

    __asm__ volatile("mov     %0,fp" : "=r"(frame));

    printf("Stack backtrace:\n");

    while (frame < frame->fp && dladdr(frame->ip, &dlip) != 0) {
        printf("%03zu : [fp=%p] [ip=%p] %s\n", i++, frame->fp, frame->ip,
               dlip.dli_sname);
        frame = frame->fp;
    }
}
