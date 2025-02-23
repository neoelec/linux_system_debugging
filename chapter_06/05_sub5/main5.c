/*
 * file: main5.c
 * main C program that uses assembly routine in sub5.asm
 * to create executable:
 * DJGPP:   gcc -o sub5 main5.c sub5.o asm_io.o
 * Borland: bcc32 sub5.obj main5.c asm_io.obj
 */

#include <stdio.h>

extern void calc_sum(long, long *); /* prototype for assembly routine */

int main(void)
{
    long n, sum;

    printf("Sum integers up to: ");
    scanf("%ld", &n);
    calc_sum(n, &sum);
    printf("Sum is %ld\n", sum);

    return 0;
}
