#ifndef __ASM_IO_H__
#define __ASM_IO_H__

#ifdef __cplusplus
extern "C" {
#endif

extern long read_long(void);
extern void print_long(long i);
extern void print_string(const char *c);
extern char read_char(void);
extern void print_char(char c);
extern void print_nl(void);

#ifdef __cplusplus
}
#endif

#endif /* __ASM_IO_H__ */
