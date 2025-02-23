#ifndef __ASM_GLUE_H__
#define __ASM_GLUE_H__

#ifdef __cplusplus
extern "C" {
#endif

extern int asm_puts(const char *s);
extern int asm_printf(const char *fmt, ...);
extern int asm_scanf(const char *fmt, ...);

#ifdef __cplusplus
}
#endif

#endif /* __ASM_GLUE_H__ */
