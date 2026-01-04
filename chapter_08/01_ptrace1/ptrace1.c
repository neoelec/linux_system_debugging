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

    printf("(%d) return : %ld\n", pid, ret);
    getchar();

    ptrace(PTRACE_DETACH, pid, NULL, NULL);

    return 0;
}
