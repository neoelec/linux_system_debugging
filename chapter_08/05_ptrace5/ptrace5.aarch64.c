#include <stdio.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/user.h>

int main(int argc, char *argv[])
{
    pid_t pid;
    off_t addr;
    long ret;
    struct user_regs_struct regs;

    if (argc < 3) {
        fprintf(stderr, "Usage) %s <PID> <ADDR>\n", argv[0]);

        return 1;
    }

    pid = atoi(argv[1]);
    addr = strtoul(argv[2], NULL, 16);

    ret = ptrace(PTRACE_ATTACH, pid, 0, 0);
    printf("return : %ld\n", ret);

    ptrace(PTRACE_GETREGSET, pid, 0, &regs);
    printf("stack = %p\n", (void *)regs.sp);

    ptrace(PTRACE_POKEDATA, pid, addr, 0x41414141);

    ptrace(PTRACE_CONT, pid, 0, 0);
    ptrace(PTRACE_DETACH, pid, 0, 0);

    return 0;
}
