extern void get_long(long i, long *inputp);
extern void print_sum(long *sump);

long sum = 0;
long input;

int main(void)
{
    long i = 1;

    while (1) {
        get_long(i, &input);

        if (input == 0) {
            break;
        }

        sum += input;
        i++;
    }

    print_sum(&sum);

    return 0;
}
