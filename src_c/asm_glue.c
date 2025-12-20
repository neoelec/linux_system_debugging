#include <stdio.h>

#include <asm_glue.h>

int asm_puts(const char *s)
{
    return puts(s);
}

int asm_printf(const char *fmt, ...)
{
    va_list ap;
    int n;

    va_start(ap, fmt);
    n = vprintf(fmt, ap);
    va_end(ap);

    return n;
}

int asm_scanf(const char *fmt, ...)
{
    va_list ap;
    int n;

    va_start(ap, fmt);
    n = vscanf(fmt, ap);
    va_end(ap);

    return n;
}
