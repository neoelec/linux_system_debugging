#include <asm_io.h>

char *Message = "Find primes up to: ";

long Limit; /* find primes up to this limit */
long Guess; /* the current guess for prime */

int main(void)
{
    print_string(Message);

    Limit = read_long();

    print_long(2);
    print_nl();
    print_long(3);
    print_nl();

    Guess = 5;

    while (Guess <= Limit) {
        long factor = 3;

        while (factor * factor < Guess && Guess % factor != 0) {
            factor += 2;
        }

        if (Guess % factor != 0) {
            print_long(Guess);
            print_nl();
        }

        Guess += 2; /* only look at odd numbers */
    }

    return 0;
}
