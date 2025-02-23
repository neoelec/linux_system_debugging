bits    64
default rel

segment .data
integer1        dq      15              ; first int
integer2        dq      6               ; second int
segment .bss
result          resq    1               ; result
segment .text
        global  asm_main
asm_main:
        enter   0, 0                    ; setup routine
        mov     rax, [integer1]
        add     rax, [integer2]
        mov     [result], rax
        mov     rax, [result]
	leave
	ret
