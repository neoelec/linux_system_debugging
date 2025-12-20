#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    const char str[] = "hello!";
    size_t i;

    for (i = 0;; i++) {
        printf("%04zu : %s\n", i, str);
        sleep(1);
    }

    return 0;
}
