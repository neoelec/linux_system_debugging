//
// file: sub1.S
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
    push    %rbp
    push    %rbx
    sub     $8,%rsp

    lea     prompt1(%rip),%rdi
    call    print_string

    lea     input1(%rip),%rbx   // store address of input1 into rbx
    lea     .L_ret1(%rip),%rbp  // store return address into rbp
    jmp     get_long            // read integer
.L_ret1:
    lea     prompt2(%rip),%rdi
    call    print_string

    lea     input2(%rip),%rbx
    lea     .L_ret2(%rip),%rbp
    jmp     get_long
.L_ret2:
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
    add     $8,%rsp
    pop     %rbx
    pop     %rbp
    ret

//
// subprogram get_long
// Parameters:
//   rbx - address of qword to store integer into
//   rbp - address of instruction to return to
// Notes:
//   value of rax is destroyed
get_long:
    call    read_long
    mov     %rax,(%rbx)         // store input into memory
    jmp     *%rbp               // jump back to caller
