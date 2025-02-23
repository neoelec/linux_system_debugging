#include <libunwind.h>
#include <stdio.h>
#include <stdlib.h>

void print_unw_backtrace(void)
{
    char name[256];
    unw_word_t ip, sp, offp;
    unw_cursor_t cursor;
    unw_context_t uc;
    size_t i = 0;

    printf("Stack backtrace:\n");
    unw_getcontext(&uc);
    unw_init_local(&cursor, &uc);
    do {
        name[0] = '\0';
        unw_get_proc_name(&cursor, name, 256, &offp);
        unw_get_reg(&cursor, UNW_REG_IP, &ip);
        unw_get_reg(&cursor, UNW_REG_SP, &sp);
        printf("%03zu : [sp=%p] [ip=%p] %s\n", i++, (void *)sp, (void *)ip,
               name);
    } while (unw_step(&cursor) > 0);
}
