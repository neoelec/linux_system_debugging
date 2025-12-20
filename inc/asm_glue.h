#ifndef __ASM_IO_GLUE_H__
#define __ASM_IO_GLUE_H__

#include <stdarg.h>

extern int asm_puts(const char *s);
extern int asm_printf(const char *fmt, ...);
extern int asm_scanf(const char *fmt, ...);

#endif /* __ASM_IO_GLUE_H__ */
