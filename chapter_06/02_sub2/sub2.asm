;
; file: sub2.asm
; Subprogram example program
;
; To create executable:
; Using djgpp:
; nasm -f coff sub2.asm
; gcc -o sub1 sub2.o driver.c asm_io.o
;
; Using Borland C/C++
; nasm -f obj sub2.asm
; bcc32 sub2.obj driver.c asm_io.obj

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
        enter   8, 0                    ; setup routine
        push    rbx

        lea     rdi, [prompt1]          ; print out prompt
        call    print_string

        mov     rbx, input1             ; store address of input1 into rbx
        call    get_int                 ; read integer

        lea     rdi, [prompt2]          ; print out prompt
        call    print_string

        mov     rbx, input2
        call    get_int

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

        pop     rbx
        mov     eax, 0                  ; return back to C
        leave
        ret
;
; subprogram get_int
; Parameters:
;   rbx - address of word to store integer into
; Notes:
;   value of rax is destroyed
get_int:
        enter   0, 0                    ; setup routine
        call    read_long
        mov     [rbx], rax              ; store input into memory
        leave
        ret                             ; jump back to caller
