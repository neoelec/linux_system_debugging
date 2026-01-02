#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ptrace.h>
#include <sys/user.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    pid_t pid;
    int status;
    long ret;
    struct user_regs_struct regs;

    if (!(pid = fork())) {
        ptrace(PTRACE_TRACEME, 0, 0, 0);
        execl("/bin/ls", "/bin/ls", NULL);

        return 0;
    }

    wait(&status);
    printf("status=%x\n", status);

    if (WIFSIGNALED(status)) {
        fprintf(stderr, "child process %d was abnormal exit.\n", pid);

        return -1;
    }

    ret = ptrace(PTRACE_GETREGSET, pid, 0, &regs);
    printf("return : %ld\n", ret);
    printf("stack rsp = %p\n", (void *)regs.sp);
    printf("pc        = %p\n", (void *)regs.pc);

    ptrace(PTRACE_DETACH, pid, 0, 0);
    /* ptrace(PTRACE_KILL, pid, 0, 0); */

    return 0;
}
