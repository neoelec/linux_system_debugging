//
// file: sub4.S
// Subprogram example
//

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
.global get_long
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

//
// subprogram print_sum
// prints out the sum
// Parameter:
//   rdi - sum to print out
// Note: destroys value of rax
.data
result:
    .asciz  "The sum is "

.text
.global print_sum
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
