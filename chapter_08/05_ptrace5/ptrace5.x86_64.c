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

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, 0, 0);
    printf("return : %ld\n", ret);

    ptrace(PTRACE_GETREGS, pid, 0, &regs);
    printf("stack = %p\n", (void *)regs.rsp);

    ptrace(PTRACE_POKEDATA, pid, 0x00007ffde0f70e21, 0x41414141);

    ptrace(PTRACE_DETACH, pid, 0, 0);

    return 0;
}
