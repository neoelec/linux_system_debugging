#include <stdio.h>

int main(int argc, char *argv[])
{
    char *p = "hello";
    char *q = "hello";

    printf("p=%p\n", p);
    printf("q=%p\n", q);
    *p = 'a'; /* runtime error */
    p = "world";

    return 0;
}
