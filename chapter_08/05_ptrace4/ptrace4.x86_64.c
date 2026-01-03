#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/user.h>

int main(int argc, char *argv[])
{
    pid_t pid;
    long ret;
    struct user_regs_struct regs;

    union {
        unsigned long l;
        unsigned char c[0];
    } data;
    size_t i, j;

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, 0, 0);
    printf("return : %ld\n", ret);

    ptrace(PTRACE_GETREGS, pid, 0, &regs);
    printf("stack = %p\n", (void *)regs.rsp);

    for (i = 0; i < 300; i++) {
        data.l = ptrace(PTRACE_PEEKDATA, pid, regs.rsp + i * 8, 0);
        printf("%.16lx : ", (unsigned long)regs.rsp + i * 8);

        for (j = 0; j < sizeof(data); j++) {
            if (isprint(data.c[j])) {
                printf("%c ", data.c[j]);
            } else {
                printf(". ");
            }
        }

        printf("%.16lx\n", data.l);
    }

    ptrace(PTRACE_DETACH, pid, 0, 0);

    return 0;
}
