#include <stdio.h>

int main(int argc, char *argv[])
{
    char a[] = "hello";

    printf("a=%s\n", a);
    *a = 'a';
    printf("a=%s\n", a);
    a = "world"; /* compile error */

    return 0;
}
