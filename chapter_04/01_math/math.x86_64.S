//
// file: math.S
// This program demonstrates how the integer multiplication and division
// instructions work.
//

.data
prompt:
    .asciz  "Enter a number: "
square_msg:
    .asciz  "Square of input is "
cube_msg:
    .asciz  "Cube of input is "
cube25_msg:
    .asciz  "Cube of input times 25 is "
quot_msg:
    .asciz  "Quotient of cube/100 is "
rem_msg:
    .asciz  "Remainder of cube/100 is "
neg_msg:
    .asciz  "The negation of the remainder is "

.bss
input:
    .skip   8

.text
.global main
main:
    push    %rbp
    push    %rbx
    sub     $8,%rsp

    lea     prompt(%rip),%rdi
    call    print_string

    call    read_long
    mov     %rax,%rbx
    mov     %rax,input(%rip)

    imul    %rax,%rbx           // rbx = input*input
    lea     square_msg(%rip),%rdi
    call    print_string
    mov     %rbx,%rdi
    call    print_long
    call    print_nl

    imul    input(%rip),%rbx    // rbx = input*input*input
    lea     cube_msg(%rip),%rdi
    call    print_string
    mov     %rbx,%rdi
    call    print_long
    call    print_nl

    imul    $25,%rbx,%rbp       // rbp = rbx*25
    lea     cube25_msg(%rip),%rdi
    call    print_string
    mov     %rbp,%rdi
    call    print_long
    call    print_nl

    mov     %rbx,%rax
    cqto                        // initialize rdx by sign extension
    mov     $100,%rcx           // can't divide by immediate value
    idiv    %rcx                // rax = rax/rcx
    mov     %rax,%rbp           // save quotient into rbp
    mul     %rcx
    sub     %rax,%rbx           // save remainder into rbx
    lea     quot_msg(%rip),%rdi
    call    print_string
    mov     %rbp,%rdi
    call    print_long
    call    print_nl
    lea     rem_msg(%rip),%rdi
    call    print_string
    mov     %rbx,%rdi
    call    print_long
    call    print_nl

    neg     %rbx
    lea     neg_msg(%rip),%rdi
    call    print_string
    mov     %rbx,%rdi
    call    print_long
    call    print_nl

    mov     $0,%eax
    add     $8,%rsp
    pop     %rbx
    pop     %rbp
    ret
