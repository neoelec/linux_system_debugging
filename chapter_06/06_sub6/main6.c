/*
 * file: main6.c
 * main C program that uses assembly routine in sub5.S
 */

#include <stdio.h>

extern long calc_sum(long n); /* prototype for assembly routine */

int main(void)
{
    long n, sum;

    printf("Sum integers up to: ");
    scanf("%ld", &n);
    sum = calc_sum(n);
    printf("Sum is %ld\n", sum);

    return 0;
}
