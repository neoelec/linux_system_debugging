#include <asm_io.h>

void get_long(long i, long *inputp);
void print_sum(long *sump);

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

char *prompt = ") Enter an integer number (0 to quit): ";

void get_long(long i, long *inputp)
{
    print_long(i);
    print_string(prompt);
    *inputp = read_long();
}

char *result = "The sum is ";

void print_sum(long *sump)
{
    print_string(result);
    print_long(*sump);
    print_nl();
}
