#define _GNU_SOURCE
#include <stdio.h>

void mcount(void)
{
    printf("%s()\n", __func__);
}

void _mcount(void) __attribute__ ((alias ("mcount")));
