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
    long data;
    size_t i;

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, 0, 0);
    printf("return : %ld\n", ret);

    ptrace(PTRACE_GETREGSET, pid, 0, &regs);
    printf("stack = %p\n", (void *)regs.sp);

    for (i = 0; i < 20; i++) {
        data = ptrace(PTRACE_PEEKDATA, pid, regs.sp + i * 8, 0);
        printf("%.16lx\n", data);
    }

    ptrace(PTRACE_DETACH, pid, 0, 0);

    return 0;
}
