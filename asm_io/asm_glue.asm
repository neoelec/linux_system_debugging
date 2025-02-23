bits 64
default rel

        extern  __asm_printf, __asm_scanf

segment .text
        global  asm_printf, asm_scanf

asm_printf:
        enter   0, 0
        xor     rax, rax
        call    __asm_printf
	leave
	ret

asm_scanf:
        enter   0, 0
        xor     rax, rax
        call    __asm_scanf
	leave
	ret
