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

    if (argc < 2) {
        fprintf(stderr, "Usage) %s <PID>\n", argv[0]);

        return 1;
    }

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, 0, 0);
    printf("return : %ld\n", ret);

    ptrace(PTRACE_GETREGS, pid, 0, &regs);
    printf("stack = 0x%.16llx\n", regs.rsp);

    ptrace(PTRACE_DETACH, pid, 0, 0);

    return 0;
}
