#include <stdio.h>

extern int asm_main(void);

int main(int argc, char *argv[])
{
    int ret;
    ret = asm_main();
    printf("ret = %d\n", ret);
    return 0;
}
