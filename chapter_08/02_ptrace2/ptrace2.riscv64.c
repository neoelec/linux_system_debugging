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

    if (argc < 2) {
        fprintf(stderr, "Usage) %s <PID>\n", argv[0]);

        return 1;
    }

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, 0, 0);
    printf("return : %ld\n", ret);

    ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &io);
    printf("stack = 0x%.16lx\n", regs.sp);

    ptrace(PTRACE_DETACH, pid, 0, 0);

    return 0;
}
