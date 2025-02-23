;
; file: sub5.asm
; Subprogram to C interfacing example

bits 64
default rel

%include "asm_io.inc"

; subroutine calc_sum
; finds the sum of the integers 1 through n
; Parameters:
;   n    - what to sum up to (at [rbp + 16])
;   sump - pointer to int to store sum into (at [rbp + 24])
; pseudo C code:
; void calc_sum( int n, int * sump )
; {
;   int i, sum = 0;
;   for( i=1; i <= n; i++ )
;     sum += i;
;   *sump = sum;
; }
;
; To assemble:
; DJGPP:   nasm -f coff sub5.asm
; Borland: nasm -f obj  sub5.asm

segment .text
        global  calc_sum
;
; local variable:
;   sum at [rbp-4]
calc_sum:
        enter   16, 0                   ; allocate room for sum on stack

        mov     qword [rbp - 8], 0      ; sum = 0
        dump_stack 1, 2, 4              ; print out stack from rbp-16 to rbp+32
        mov     rcx, 1                  ; rcx is i in pseudocode
for_loop:
        cmp     rcx, rdi                ; cmp i and n
        jnle    end_for                 ; if not i <= n, quit

        add     [rbp - 8], rcx          ; sum += i
        inc     rcx
        jmp     for_loop

end_for:
        mov     rax, [rbp - 8]          ; rax = sum
        mov     [rsi], rax

        leave
        ret
