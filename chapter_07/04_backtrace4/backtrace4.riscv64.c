#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>

extern char __executable_start;

struct frame {
    struct frame *fp;
    void *ip;
};

void print_walk_through2(void)
{
    struct frame *frame;
    size_t i = 0;
    Dl_info dlip;

    __asm__ volatile("mv      %0,fp" : "=r"(frame));
    frame -= 1;

    printf("Stack backtrace:\n");

    while (frame < frame->fp && dladdr(frame->ip, &dlip) != 0) {
        printf("%03zu : [fp=%p] [ip=%p] %s\n", i++, frame->fp, frame->ip,
               dlip.dli_sname);
        frame = frame->fp - 1;
    }
}
