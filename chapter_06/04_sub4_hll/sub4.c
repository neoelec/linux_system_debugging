#include <asm_io.h>

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
