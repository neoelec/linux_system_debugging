#include <ctype.h>
#include <elf.h>
#include <linux/uio.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/user.h>

#include <asm/ptrace.h>

int main(int argc, char *argv[])
{
    pid_t pid;
    long ret;
    struct user_regs_struct regs;
    struct iovec io = {
        .iov_base = &regs,
        .iov_len = sizeof(regs),
    };

    union {
        unsigned long l;
        unsigned char c[0];
    } data;
    size_t i, j;

    if (argc < 2) {
        fprintf(stderr, "Usage) %s <PID>\n", argv[0]);

        return 1;
    }

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, 0, 0);
    printf("return : %ld\n", ret);

    ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &io);
    printf("stack = 0x%.16lx\n", regs.sp);

    for (i = 0; i < 300; i++) {
        data.l = ptrace(PTRACE_PEEKDATA, pid, regs.sp + i * 8, 0);
        printf("%.16lx : ", regs.sp + i * 8);

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
