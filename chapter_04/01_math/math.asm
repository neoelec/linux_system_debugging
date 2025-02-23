;
; file: math.asm
; This program demonstrates how the integer multiplication and division
; instructions work.
;
; To create executable:
; nasm -f coff math.asm
; gcc -o math math.o driver.c asm_io.o

bits 64
default rel

%include "asm_io.inc"

segment .data
;
; Output strings
;
prompt          db      "Enter a number: ", 0
square_msg      db      "Square of input is ", 0
cube_msg        db      "Cube of input is ", 0
cube25_msg      db      "Cube of input times 25 is ", 0
quot_msg        db      "Quotient of cube/100 is ", 0
rem_msg         db      "Remainder of cube/100 is ", 0
neg_msg         db      "The negation of the remainder is ", 0

segment .bss
input           resq    1

segment .text
        global  asm_main
asm_main:
        enter   8, 0                    ; setup routine
        push    rbx
        push    r12
        push    r13

        lea     rdi, [prompt]
        call    print_string

        call    read_long
        mov     [input], rax

        imul    rax                     ; rdx:rax = rax * rax
        mov     rbx, rax                ; save answer in rbx
        lea     rdi, [square_msg]
        call    print_string
        mov     rdi, rbx
        call    print_long
        call    print_nl

        imul    rbx, [input]            ; rbx *= [input]
        lea     rdi, [cube_msg]
        call    print_string
        mov     rdi, rbx
        call    print_long
        call    print_nl

        imul    rcx, rbx, 25            ; rcx = rbx*25
        mov     r12, rcx
        lea     rdi, [cube25_msg]
        call    print_string
        mov     rdi, r12
        call    print_long
        call    print_nl

        mov     rax, rbx
        cqo                             ; initialize rdx by sign extension
        mov     rcx, 100                ; can't divide by immediate value
        idiv    rcx                     ; rdx:rax / rcx
        mov     r12, rax                ; save quotient into r12
        mov     r13, rdx                ; save remainter into r13
        lea     rdi, [quot_msg]
        call    print_string
        mov     rdi, r12
        call    print_long
        call    print_nl
        lea     rdi, [rem_msg]
        call    print_string
        mov     rdi, r13
        call    print_long
        call    print_nl

        neg     r13                     ; negate the remainder
        lea     rdi, [neg_msg]
        call    print_string
        mov     rdi, r13
        call    print_long
        call    print_nl

        pop     r13
        pop     r12
        pop     rbx
        mov     eax, 0                  ; return back to C
        leave
        ret
