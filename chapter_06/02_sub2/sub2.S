//
// file: sub2.S
// Subprogram example program
//

.data
prompt1:
    .asciz  "Enter a number: "
prompt2:
    .asciz  "Enter another number: "
outmsg1:
    .asciz  "You entered "
outmsg2:
    .asciz  " and "
outmsg3:
    .asciz  ", the sum of these is "

.bss
input1:
    .skip   8
input2:
    .skip   8

.text
.global main
main:
    push    %rbx

    lea     prompt1(%rip),%rdi
    call    print_string

    lea     input1(%rip),%rdi   // store address of input1 into rdi
    call    get_long            // read integer

    lea     prompt2(%rip),%rdi
    call    print_string

    lea     input2(%rip),%rdi
    call    get_long
    mov     input2(%rip),%rbx
    add     input1(%rip),%rbx

    lea     outmsg1(%rip),%rdi
    call    print_string
    mov     input1(%rip),%rdi
    call    print_long
    lea     outmsg2(%rip),%rdi
    call    print_string
    mov     input2(%rip),%rdi
    call    print_long
    lea     outmsg3(%rip),%rdi
    call    print_string
    mov     %rbx,%rdi
    call    print_long
    call    print_nl

    mov     $0,%eax
    pop     %rbx
    ret

//
// subprogram get_long
// Parameters:
//   rdi - address of word to store integer into
// Notes:
//   value of rax is destroyed
get_long:
    push    %rbx                // setup routine
    mov     %rdi,%rbx
    call    read_long
    mov     %rax,(%rbx)         // store input into memory
    pop     %rbx
    ret                         // jump back to caller
