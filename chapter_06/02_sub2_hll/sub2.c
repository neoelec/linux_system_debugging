#include <asm_io.h>

void get_long(long *input);

char *prompt1 = "Enter a number: ";
char *prompt2 = "Enter another number: ";
char *outmsg1 = "You entered ";
char *outmsg2 = " and ";
char *outmsg3 = ", the sum of these is ";

long input1;
long input2;

int main(void)
{
    long result;

    print_string(prompt1);
    get_long(&input1);

    print_string(prompt2);
    get_long(&input2);

    result = input1 + input2;

    print_string(outmsg1);
    print_long(input1);
    print_string(outmsg2);
    print_long(input2);
    print_string(outmsg3);
    print_long(result);
    print_nl();

    return 0;
}

void get_long(long *input)
{
    *input = read_long();
}
