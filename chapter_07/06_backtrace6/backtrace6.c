#include <execinfo.h>
#include <libunwind.h>
#include <stdio.h>
#include <stdlib.h>

void sighandler(int sig)
{
    char name[256];
    unw_word_t ip, sp, offp;
    unw_cursor_t cursor;
    unw_context_t uc;
    size_t i = 0;

    unw_getcontext(&uc);
    unw_init_local(&cursor, &uc);
    unw_step(&cursor);

    do {
        name[0] = '\0';
        unw_get_proc_name(&cursor, name, 256, &offp);
        unw_get_reg(&cursor, UNW_REG_IP, &ip);
        unw_get_reg(&cursor, UNW_REG_SP, &sp);
        printf("%03zu : [sp=%p] [ip=%p] %s\n", i++, (void *)sp, (void *)ip,
               name);
    } while (unw_step(&cursor) > 0);

    exit(1);
}
