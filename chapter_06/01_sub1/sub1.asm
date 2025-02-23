;
; file: sub1.asm
; Subprogram example program
;
; To create executable:
; Using djgpp:
; nasm -f coff sub1.asm
; gcc -o sub1 sub1.o driver.c asm_io.o
;

bits 64
default rel

%include "asm_io.inc"

segment .data
prompt1         db      "Enter a number: ", 0 ; don't forget nul terminator
prompt2         db      "Enter another number: ", 0
outmsg1         db      "You entered ", 0
outmsg2         db      " and ", 0
outmsg3         db      ", the sum of these is ", 0

segment .bss
;
; These labels refer to double words used to store the inputs
;
input1          resq    1
input2          resq    1

segment .text
        global  asm_main
asm_main:
        enter   0, 0                    ; setup routine
        push    rbx
        push    r12

        lea     rdi, [prompt1]          ; print out prompt
        call    print_string

        mov     rbx, input1             ; store address of input1 into rbx
        mov     r12, ret1               ; store return address into r12
        jmp     get_int                 ; read integer
ret1:
        lea     rdi, [prompt2]          ; print out prompt
        call    print_string

        mov     rbx, input2
        mov     r12, $ + 12             ; r12 = this address + 12
        jmp     get_int

        mov     rax, [input1]           ; rax = dword at input1
        add     rax, [input2]           ; rax += dword at input2
        mov     rbx, rax                ; rbx = rax
;
; next print out result message as series of steps
;

        lea     rdi, [outmsg1]
        call    print_string            ; print out first message
        mov     rdi, [input1]
        call    print_long              ; print out input1
        lea     rdi, [outmsg2]
        call    print_string            ; print out second message
        mov     rdi, [input2]
        call    print_long              ; print out input2
        lea     rdi, [outmsg3]
        call    print_string            ; print out third message
        mov     rdi, rbx
        call    print_long              ; print out sum (rbx)
        call    print_nl                ; print new-line

        pop     r12
        pop     rbx
        mov     eax, 0                  ; return back to C
        leave
        ret
;
; subprogram get_int
; Parameters:
;   rbx - address of dword to store integer into
;   r12 - address of instruction to return to
; Notes:
;   value of rax is destroyed
get_int:
        call    read_long
        mov     [rbx], rax              ; store input into memory
        jmp     r12                     ; jump back to caller
