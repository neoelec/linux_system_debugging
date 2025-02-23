;
; file: sub3.asm
; Subprogram example program
;
; To create executable:
; Using djgpp:
; nasm -f coff sub3.asm
; gcc -o sub1 sub3.o driver.c asm_io.o
;
; Using Borland C/C++
; nasm -f obj sub3.asm
; bcc32 sub3.obj driver.c asm_io.obj

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
; while( get_int(i, &input), input != 0 ) {
;   sum += input;
;   i++;
; }
; print_sum(num);

segment .text
        global  asm_main
asm_main:
        enter   8, 0                    ; setup routine
        push    r12

        mov     r12, 1                  ; r12 is 'i' in pseudo-code
while_loop:
        push    r12                     ; save i on stack
        lea     rax, input
        push    rax                     ; push address on input on stack
        call    get_int
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

;
; subprogram get_int
; Parameters (in order pushed on stack)
;   number of input (at [rbp + 24])
;   address of word to store input into (at [rbp + 16])
; Notes:
;   values of rax and rbx are destroyed
segment .data
prompt          db      ") Enter an integer number (0 to quit): ", 0

segment .text
get_int:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 8

        mov     rdi, [rbp + 24]
        call    print_long

        lea     rdi, [prompt]
        call    print_string

        call    read_long
        mov     rbx, [rbp + 16]
        mov     [rbx], rax              ; store input into memory

        add     rsp, 8
        pop     rbx
        pop     rbp
        ret                             ; jump back to caller

; subprogram print_sum
; prints out the sum
; Parameter:
;   sum to print out (at [rbp+16])
; Note: destroys value of rax
;
segment .data
result          db      "The sum is ", 0

segment .text
print_sum:
        push    rbp
        mov     rbp, rsp

        lea     rdi, [result]
        call    print_string

        mov     rax, [rbp + 16]
        mov     rdi, [rax]
        call    print_long
        call    print_nl

        pop     rbp
        ret
