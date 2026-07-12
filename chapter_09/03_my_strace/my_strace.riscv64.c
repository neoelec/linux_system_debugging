#include <elf.h>
#include <linux/uio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ptrace.h>
#include <sys/syscall.h>
#include <sys/user.h>
#include <sys/wait.h>
#include <unistd.h>

#include <asm/ptrace.h>

int read_addr_into_buff(const pid_t pid, const unsigned long long addr,
                        char *buff, unsigned int buff_size)
{
    unsigned int bytes_read = 0;
    long *read_addr = (long *)addr;
    long *copy_addr = (long *)buff;
    unsigned long ret;

    memset(buff, '\0', buff_size);

    do {
        ret = ptrace(PTRACE_PEEKTEXT, pid, (read_addr++), NULL);
        *(copy_addr++) = ret;
        bytes_read += sizeof(long);

        if (memchr(&ret, 0, sizeof(ret)) != NULL) {
            break;
        }
    } while (bytes_read < (buff_size - sizeof(long)));

    return bytes_read;
}

int main(int argc, char *argv[])
{
    int flag = 0;
    pid_t pid;
    int status;
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

    while (1) {
        if (waitpid(pid, &status, 0) < 0) {
            perror("waitpid");
            return -1;
        }

        if (WIFSIGNALED(status)) {
            fprintf(stderr, "child %d was abnormal exit.\n", pid);

            return -1;
        }

        if (WIFEXITED(status)) {
            fprintf(stderr, "child %d was normal exit.\n", pid);

            return 0;
        }

        if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &io) < 0) {
            perror("ptrace GETREGSET");
            return -1;
        }

        if (regs.a7 == SYS_openat) {
            if (flag == 0) {
                char buff[256] = {
                    0,
                };
                read_addr_into_buff(pid, regs.a1, buff, 256);
                printf("openat(0x%lx, \"%s\", 0x%lx)", regs.a0, buff, regs.a2);
                flag = 1;
            } else if (flag == 1) {
                printf(" -> a0 = %ld\n", regs.a0);
                flag = 0;
            }
        }

        if (ptrace(PTRACE_SYSCALL, pid, NULL, NULL) < 0) {
            perror("ptrace SYSCALL");
            return -1;
        }
    }

    return 0;
}
