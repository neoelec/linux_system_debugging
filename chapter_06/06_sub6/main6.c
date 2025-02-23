/*
 * file: main6.c
 * main C program that uses assembly routine in sub5.asm
 * to create executable:
 * DJGPP:   gcc -o sub5 main5.c sub5.o
 * Borland: bcc32 sub5.obj main5.c
 */

#include <stdio.h>

extern long calc_sum(long); /* prototype for assembly routine */

int main(void)
{
    long n, sum;

    printf("Sum integers up to: ");
    scanf("%ld", &n);
    sum = calc_sum(n);
    printf("Sum is %ld\n", sum);

    return 0;
}
