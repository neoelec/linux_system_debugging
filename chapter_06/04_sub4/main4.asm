;
; file: main4.asm
; Multi-module subprogram example program
;
; To create executable:
; Using djgpp:
; nasm -f coff sub4.asm
; nasm -f coff main4.asm
; gcc -o sub4 sub4.o main4.o driver.c asm_io.o
;
; Using Borland C/C++
; nasm -f obj sub4.asm
; nasm -f obj main4.asm
; bcc32 sub4.obj main4.asm driver.c asm_io.obj

bits 64
default rel

%include "asm_io.inc"

segment .data
sum             dq      0

segment .bss
input           resq    1

;
; psuedo-code algorithm
; i = 1;
; sum = 0;
; while( get_long(i, &input), input != 0 ) {
;   sum += input;
;   i++;
; }
; print_sum(num);

segment .text
        global  asm_main
        extern  get_long, print_sum
asm_main:
        enter   8, 0                    ; setup routine
        push    r12

        mov     r12, 1                  ; r12 is 'i' in pseudo-code
while_loop:
        push    r12                     ; save i on stack
        lea     rax, input
        push    rax                     ; push address on input on stack
        call    get_long
        add     rsp, 16                 ; remove i and &input from stack

        mov     rax, [input]
        cmp     rax, 0
        je      end_while

        add     [sum], rax              ; sum += input

        inc     r12
        jmp     while_loop

end_while:
        lea     rax, sum
        push    rax                     ; push value of sum onto stack
        call    print_sum
        pop     rcx                     ; remove [sum] from stack

        pop     r12
        leave
        mov     eax, 0
        ret
