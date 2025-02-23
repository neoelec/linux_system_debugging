;
; file: sub4.asm
; Subprogram example

bits 64
default rel

%include "asm_io.inc"

;
; subprogram get_long
; Parameters (in order pushed on stack)
;   number of input (at [rbp + 24])
;   address of word to store input into (at [rbp + 16])
; Notes:
;   values of rax and rbx are destroyed
segment .data
prompt          db      ") Enter an integer number (0 to quit): ", 0

segment .bss

segment .text
        global  get_long, print_sum
get_long:
        enter   8, 0
        push    rbx

        mov     rdi, [rbp + 24]
        call    print_long

        lea     rdi, [prompt]
        call    print_string

        call    read_long
        mov     rbx, [rbp + 16]
        mov     [rbx], rax              ; store input into memory

        leave
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
        enter   0, 0

        lea     rdi, [result]
        call    print_string

        mov     rax, [rbp + 16]
        mov     rdi, [rax]
        call    print_long
        call    print_nl

        leave
        ret
