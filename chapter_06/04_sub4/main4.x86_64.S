//
// file: main4.S
// Multi-module subprogram example program
//

.data
sum:
    .quad   0

.bss
input:
    .skip   8

.text
.global main
main:
    push    %rbx

    mov     $1,%rbx             // rbx is 'i' in pseudo-code
.L_while_loop:
    lea     input(%rip),%rsi
    mov     %rbx,%rdi
    call    get_long

    mov     input(%rip),%rax
    test    %rax,%rax
    je      .L_end_while_loop
    add     %rax,sum(%rip)

    add     $1,%rbx
    jmp     .L_while_loop
.L_end_while_loop:

    lea     sum(%rip),%rdi
    call    print_sum
    mov     $0,%eax
    pop     %rbx
    ret
