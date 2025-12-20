#include <stdio.h>

int main(int argc, char *argv[])
{
    char *p = "hello";

    printf("sizeof(p)=%lu\n", sizeof(p));
    printf("sizeof(\"hello\")=%lu\n", sizeof("hello"));
    printf("p=%s\n", p);
    printf("p=%s\n", "hello");

    return 0;
}
