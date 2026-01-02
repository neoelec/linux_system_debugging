//
// file: prime.S
// This program calculates prime numbers
//

.data
Message:
    .asciz  "Find primes up to: "

.bss
Limit:
    .skip   8                   // find primes up to this limit
Guess:
    .skip   8                   // the current guess for prime

.text
.global main
main:
    sub     $8,%rsp

    lea     Message(%rip),%rdi
    call    print_string

    call    read_long
    mov     %rax,Limit(%rip)

    mov     $2,%rdi
    call    print_long
    call    print_nl
    mov     $3,%rdi
    call    print_long
    call    print_nl

    movq    $5,Guess(%rip)

.L_while_limit:
    mov     Guess(%rip),%rdi
    cmp     Limit(%rip),%rdi
    jg      .L_end_while_limit

    mov     $3,%rcx             // rcx is factor = 3
 .L_while_factor:
    mov     %rcx,%rax
    imul    %rcx,%rax
    cmp     %rdi,%rax
    jge     .L_end_while_factor
    mov     %rdi,%rax
    cqto
    idiv    %rcx
    test    %rdx,%rdx
    je      .L_end_while_factor
    add     $2,%rcx
    jmp     .L_while_factor
.L_end_while_factor:
    mov     %rdi,%rax
    cqto
    idiv    %rcx
    test    %rdx,%rdx
    je      .L_end_if
    call    print_long
    call    print_nl
.L_end_if:
    addq    $2,Guess(%rip)
    jmp     .L_while_limit
.L_end_while_limit:

    mov     $0,%eax
    add     $8,%rsp
    ret
