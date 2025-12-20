/*
 * file: main5.c
 * main C program that uses assembly routine in sub5.S
 * to create executable:
 */

#include <stdio.h>

extern void calc_sum(long n, long *sump); /* prototype for assembly routine */

int main(void)
{
    long n, sum;

    printf("Sum integers up to: ");
    scanf("%ld", &n);
    calc_sum(n, &sum);
    printf("Sum is %ld\n", sum);

    return 0;
}
