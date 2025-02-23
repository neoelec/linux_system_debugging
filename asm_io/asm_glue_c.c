#include <stdarg.h>
#include <stdio.h>

int asm_puts(const char *s)
{
    return puts(s);
}

int __asm_printf(const char *fmt, ...)
{
    va_list ap;
    int n;

    va_start(ap, fmt);
    n = vprintf(fmt, ap);
    va_end(ap);

    return n;
}

int __asm_scanf(const char *fmt, ...)
{
    va_list ap;
    int n;

    va_start(ap, fmt);
    n = vscanf(fmt, ap);
    va_end(ap);

    return n;
}
