#include <signal.h>
#include <stdio.h>

extern void sighandler(int sig);

int foo(void)
{
    int *p = (int *)-1;

    printf("%d\n", *p);

    return 0;
}

int bar(void)
{
    foo();

    return 0;
}

int boo(void)
{
    bar();

    return 0;
}

int baz(void)
{
    boo();

    return 0;
}

int main(int argc, char *argv[])
{
    signal(SIGSEGV, sighandler);
    baz();

    return 0;
}
