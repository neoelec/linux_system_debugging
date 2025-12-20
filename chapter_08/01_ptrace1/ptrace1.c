#include <stdio.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/types.h>

int main(int argc, char *argv[])
{
    pid_t pid;
    long ret;

    pid = atoi(argv[1]);

    ret = ptrace(PTRACE_ATTACH, pid, 0, 0);

    printf("(%d) return : %ld\n", pid, ret);
    getchar();

    ptrace(PTRACE_DETACH, pid, 0, 0);

    return 0;
}
