void calc_sum(long n, long *sump)
{
    long i, sum = 0;

    for (i = 1; i <= n; i++) {
        sum += i;
    }

    *sump = sum;
}
