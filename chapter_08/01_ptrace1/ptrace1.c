#include <stdio.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/types.h>

int main(int argc, char *argv[])
{
    pid_t pid;
    long ret;

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, NULL, NULL);

    if (ret < 0) {
        perror("ptrace ATTACH");
        return -1;
    }

    printf("(%d) return : %ld\n", pid, ret);
    getchar();

    if (ptrace(PTRACE_DETACH, pid, NULL, NULL) < 0) {
        perror("ptrace DETACH");
        return -1;
    }

    return 0;
}
