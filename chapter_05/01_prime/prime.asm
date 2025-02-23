;
; file: prime.asm
; This program calculates prime numbers
;
; To create executable:
; nasm -f coff prime.asm
; gcc -o prime prime.o driver.c asm_io.o
;
; Works like the following C program:
; #include <stdio.h>
;
;int main()
;{
;  unsigned guess;          /* current guess for prime      */
;  unsigned factor;         /* possible factor of guess     */
;  unsigned limit;          /* find primes up to this value */
;
;  printf("Find primes up to: ");
;  scanf("%u", &limit);
;
;  printf("2\n");    /* treat first two primes as special case */
;  printf("3\n");
;
;  guess = 5;        /* initial guess */
;  while ( guess <= limit ) {
;    /* look for a factor of guess */
;    factor = 3;
;    while ( factor*factor < guess && guess % factor != 0 )
;      factor += 2;
;    if ( guess % factor != 0 )
;      printf("%d\n", guess);
;    guess += 2;    /* only look at odd numbers */
;  }
;  return 0;
;}
;

bits 64
default rel

%include "asm_io.inc"

segment .data
Message         db      "Find primes up to: ", 0

segment .bss
Limit           resq    1               ; find primes up to this limit
Guess           resq    1               ; the current guess for prime

segment .text
        global  asm_main
asm_main:
        enter   0, 0                    ; setup routine

        lea     rdi, [Message]
        call    print_string

        call    read_long               ; scanf("%lu", & limit );
        mov     [Limit], rax

        mov     rdi, 2                  ; printf("2\n");
        call    print_long
        call    print_nl
        mov     rdi, 3                  ; printf("3\n");
        call    print_long
        call    print_nl

        mov     dword [Guess], 5        ; Guess = 5;

while_limit:                            ; while ( Guess <= Limit )
        mov     rax, [Guess]
        cmp     rax, [Limit]
        jnbe    end_while_limit         ; use jnbe since numbers are unsigned

        mov     rbx, 3                  ; rbx is factor = 3;
while_factor:
        mov     rax, rbx
        mul     rax                     ; rdx:rax = rax*rax
        jo      end_while_factor        ; if answer won't fit in rax alone
        cmp     rax, [Guess]
        jnb     end_while_factor        ; if !(factor*factor < guess)
        mov     rax, [Guess]
        mov     rdx, 0
        div     rbx                     ; rdx = rdx:rax % rbx
        cmp     rdx, 0
        je      end_while_factor        ; if !(guess % factor != 0)

        add     rbx, 2                  ; factor += 2;
        jmp     while_factor
end_while_factor:
        je      end_if                  ; if !(guess % factor != 0)
        mov     rdi, [Guess]            ; printf("%lu\n")
        call    print_long
        call    print_nl
end_if:
        mov     rax, [Guess]
        add     rax, 2
        mov     [Guess], rax            ; guess += 2
        jmp     while_limit
end_while_limit:

        mov     eax, 0                  ; return back to C
        leave
        ret
