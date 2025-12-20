#include <stdlib.h>

int main(int argc, char *argv[])
{
    char *p = malloc(8192);

    *p = 10;
    p[5000] = 20;

    free(p);

    return 0;
}
