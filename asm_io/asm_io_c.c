#include <ctype.h>
#include <stdio.h>

#define CF_MASK 0x00000001
#define PF_MASK 0x00000004
#define AF_MASK 0x00000010
#define ZF_MASK 0x00000040
#define SF_MASK 0x00000080
#define DF_MASK 0x00000400
#define OF_MASK 0x00000800

static const char *long_format = "%li";
static const char *string_format = "%s";
static const char *reg_format =
    "Register Dump # %ld\n"
    "RAX = %.16lX RBX = %.16lX RCX = %.16lX RDX = %.16lX\n"
    "RSI = %.16lX RDI = %.16lX R8  = %.16lX R9  = %.16lX\n"
    "R10 = %.16lX R11 = %.16lX R12 = %.16lX R13 = %.16lX\n"
    "R14 = %.16lX R15 = %.16lX RBP = %.16lX RSP = %.16lX\n"
    "RIP = %.16lX FLAGS = %.4X %s %s %s %s %s %s %s\n";
static const char *carry_flag = "CF";
static const char *zero_flag = "ZF";
static const char *sign_flag = "SF";
static const char *parity_flag = "PF";
static const char *overflow_flag = "OF";
static const char *dir_flag = "DF";
static const char *aux_carry_flag = "AF";
static const char *unset_flag = "  ";
static const char *mem_format1 = "Memory Dump # %ld Address = %.16lX\n";
static const char *mem_format2 = "%.16lX  ";
static const char *mem_format3 = "%.2X ";
static const char *stack_format = "Stack Dump # %ld\n"
                                  "RBP = %.16lX RSP = %.16lX\n";
static const char *stack_line_format = "%+4ld  %.16lX  %.16lX\n";

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

#define CALLER_SAVE \
    long rax;       \
    long rcx;       \
    long rdx;       \
    long rsi;       \
    long rdi;       \
    long r8;        \
    long r9;        \
    long r10;       \
    long r11;       \
    long rflags

#define CALLEE_SAVE \
    long rbx;       \
    long r12;       \
    long r13;       \
    long r14;       \
    long r15;       \
    long rbp;       \
    long rsp

struct dump_regs {
    CALLER_SAVE;
    CALLEE_SAVE;
    long __return_addr;
    long num;
    long __rbp;
    long __rsp;
    long __rflags;
};

void __sub_dump_regs(const struct dump_regs *regs)
{
    printf(reg_format, regs->num, regs->rax, regs->rbx, regs->rcx, regs->rdx,
           regs->rsi, regs->rdi, regs->r8, regs->r9, regs->r10, regs->r11,
           regs->r12, regs->r13, regs->r14, regs->r15, regs->rbp,
           regs->__rsp - 8, regs->__return_addr, regs->rflags,
           regs->rflags & CF_MASK ? carry_flag : unset_flag,
           regs->rflags & PF_MASK ? parity_flag : unset_flag,
           regs->rflags & AF_MASK ? aux_carry_flag : unset_flag,
           regs->rflags & ZF_MASK ? zero_flag : unset_flag,
           regs->rflags & SF_MASK ? sign_flag : unset_flag,
           regs->rflags & DF_MASK ? dir_flag : unset_flag,
           regs->rflags & OF_MASK ? overflow_flag : unset_flag);
}

struct dump_stack {
    CALLER_SAVE;
    long __return_addr;
    long num;
    long cnt_top;
    long cnt_btm;
    long __rbp;
    long __rsp;
    long __rflags;
};

void __sub_dump_stack(const struct dump_stack *stk)
{
    long top = stk->__rbp - (stk->cnt_top << 3);
    long btm = stk->__rbp + (stk->cnt_btm << 3);
    long i = stk->cnt_btm;

    printf(stack_format, stk->num, stk->__rbp, stk->__rsp - 8);

    do {
        printf(stack_line_format, i << 3, btm, *(long *)btm);
        btm -= 8;
        i--;
    } while (top <= btm);
}

struct dump_mem {
    CALLER_SAVE;
    long __return_addr;
    long num;
    long base;
    long nr_lines;
    long __unused_0;
    long __rdi;
    long __rflags;
};

void __sub_dump_mem(const struct dump_mem *mem)
{
    long ptr;
    long line;

    printf(mem_format1, mem->num, mem->base);

    ptr = (~0xFUL) & mem->base;
    line = 0;
    do {
        long end = ptr + 16;

        printf(mem_format2, ptr);
        while (ptr < end) {
            printf(mem_format3, *(char *)ptr);
            ptr++;
        }

        putchar('"');
        ptr -= 16;
        while (ptr < end) {
            if (isprint(*(char *)ptr))
                putchar(*(char *)ptr);
            else
                putchar('.');

            ptr++;
        }

        putchar('"');
        putchar('\n');
        line++;
    } while (line <= mem->nr_lines);
}
