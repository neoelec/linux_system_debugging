#include <elf.h>
#include <linux/uio.h>
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
    struct iovec io = {
        .iov_base = &regs,
        .iov_len = sizeof(regs),
    };
    long data;

    if (argc < 2) {
        fprintf(stderr, "Usage) %s <PID>\n", argv[0]);

        return 1;
    }

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, NULL, NULL);
    printf("return : %ld\n", ret);

    ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &io);
    printf("stack = 0x%.16llx\n", regs.sp);

    for (size_t i = 0; i < 20; i++) {
        data = ptrace(PTRACE_PEEKDATA, pid, regs.sp + i * 8, 0);
        printf("%.16lx\n", data);
    }

    ptrace(PTRACE_DETACH, pid, NULL, NULL);

    return 0;
}
