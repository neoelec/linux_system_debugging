#include <asm_io.h>

char *prompt = "Enter a number: ";
char *square_msg = "Square of input is ";
char *cube_msg = "Cube of input is ";
char *cube25_msg = "Cube of input times 25 is ";
char *quot_msg = "Quotient of cube/100 is ";
char *rem_msg = "Remainder of cube/100 is ";
char *neg_msg = "The negation of the remainder is ";

long input;

int main(void)
{
    long square;
    long cube;
    long cube25;
    long quot;
    long rem;

    print_string(prompt);
    input = read_long();

    square = input * input;
    print_string(square_msg);
    print_long(square);
    print_nl();

    cube = square * input;
    print_string(cube_msg);
    print_long(cube);
    print_nl();

    cube25 = cube * 25;
    print_string(cube25_msg);
    print_long(cube25);
    print_nl();

    quot = cube / 100;
    rem = cube % 100;
    print_string(quot_msg);
    print_long(quot);
    print_nl();
    print_string(rem_msg);
    print_long(rem);
    print_nl();

    rem = -rem;
    print_string(neg_msg);
    print_long(rem);
    print_nl();

    return 0;
}
