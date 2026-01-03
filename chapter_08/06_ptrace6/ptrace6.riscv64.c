#include <elf.h>
#include <linux/uio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ptrace.h>
#include <sys/user.h>
#include <sys/wait.h>
#include <unistd.h>

#include <asm/ptrace.h>

int main(int argc, char *argv[])
{
    pid_t pid;
    int status;
    long ret;
    struct user_regs_struct regs;
    struct iovec io = {
        .iov_base = &regs,
        .iov_len = sizeof(regs),
    };

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

    ret = ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &io);
    printf("return : %ld\n", ret);
    printf("stack sp  = 0x%.16lx\n", regs.sp);
    printf("pc        = 0x%.16lx\n", regs.pc);

    ptrace(PTRACE_DETACH, pid, 0, 0);
    /* ptrace(PTRACE_KILL, pid, 0, 0); */

    return 0;
}
