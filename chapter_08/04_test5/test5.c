#include <stdio.h>

int main(int argc, char *argv[])
{
    size_t i;

    for (i = 0; "hello"[i]; i++) {
        putchar("hello"[i]);
    }

    putchar('\n');

    return 0;
}
