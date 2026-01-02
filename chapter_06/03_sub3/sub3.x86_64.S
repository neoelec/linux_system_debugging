//
// file: sub3.S
// Subprogram example program
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

//
// subprogram get_long
// Parameters (in order pushed on stack)
//   rdi - number of input
//   rsi - address of word to store input into
// Notes:
//   values of rax and rbx are destroyed
.data
prompt:
    .asciz  ") Enter an integer number (0 to quit): "

.text
get_long:
    push    %rbx

    mov     %rsi,%rbx
    call    print_long

    lea     prompt(%rip),%rdi
    call    print_string

    call    read_long
    mov     %rax,(%rbx)

    pop     %rbx
    ret

// subprogram print_sum
// prints out the sum
// Parameter:
//   rdi - sum to print out
// Note: destroys value of rax
//
.data
result:
    .asciz  "The sum is "

.text
print_sum:
    push    %rbx
    mov     %rdi,%rbx

    lea     result(%rip),%rdi
    call    print_string

    mov     (%rbx),%rdi
    call    print_long
    call    print_nl

    pop     %rbx
    ret
