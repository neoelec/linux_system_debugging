#include <stdio.h>

#include <asm_io.h>

static const char *long_format = "%li";
static const char *string_format = "%s";

long read_long(void)
{
    long i;

    scanf(long_format, &i);

    return i;
}

void print_long(long i)
{
    printf(long_format, i);
}

void print_string(const char *c)
{
    printf(string_format, c);
}

char read_char(void)
{
    return (char)getchar();
}

void print_char(char c)
{
    putchar(c);
}

void print_nl(void)
{
    putchar('\n');
}
