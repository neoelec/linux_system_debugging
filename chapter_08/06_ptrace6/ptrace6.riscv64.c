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

    pid = fork();

    if (pid < 0) {
        perror("fork");
        return -1;
    }

    if (!pid) {
        if (ptrace(PTRACE_TRACEME, 0, 0, 0) < 0) {
            perror("ptrace TRACEME");
            return -1;
        }

        execl("/bin/ls", "/bin/ls", NULL);
        perror("execl");
        return -1;
    }

    if (waitpid(pid, &status, 0) < 0) {
        perror("waitpid");
        return -1;
    }

    printf("status=%x\n", status);

    if (WIFSIGNALED(status)) {
        fprintf(stderr, "child process %d was abnormal exit.\n", pid);

        return -1;
    }

    if (!WIFSTOPPED(status)) {
        fprintf(stderr, "child process %d is not stopped.\n", pid);

        return -1;
    }

    ret = ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &io);

    if (ret < 0) {
        perror("ptrace GETREGSET");
        return -1;
    }

    printf("return : %ld\n", ret);
    printf("stack sp  = 0x%.16lx\n", regs.sp);
    printf("pc        = 0x%.16lx\n", regs.pc);

    if (ptrace(PTRACE_DETACH, pid, NULL, NULL) < 0) {
        perror("ptrace DETACH");
        return -1;
    }

    /* ptrace(PTRACE_KILL, pid, NULL, NULL); */

    return 0;
}
