#include <math.h>

#define N 10000000UL

#define USELESSNESS(n)            \
    do {                          \
        unsigned long i;          \
        double x = 42;            \
        for (i = 0; i < (n); i++) \
            x = sin(x);           \
    } while (0)

void baz(void)
{
    USELESSNESS(N);
}

void bar(void)
{
    USELESSNESS(2 * N);
    baz();
}

void foo(void)
{
    USELESSNESS(3 * N);
    bar();
    baz();
}

int main(int argc, char *argv[])
{
    foo();

    return 0;
}
