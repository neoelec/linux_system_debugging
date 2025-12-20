//
// file: first.S
// First assembly program. This program asks for two integers as
// input and prints out their sum.
//

//
// initialized data is put in the .data segment
//
.data
//
// These labels refer to strings used for output
//
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

//
// uninitialized data is put in the .bss segment
//
.bss
//
// These labels refer to double words used to store the inputs
//
input1:
    .skip   8
input2:
    .skip   8

//
// code is put in the .text segment
//
.text
.global main
main:
    push    %rbx                // setup routine

    lea     prompt1(%rip),%rdi  // print out prompt
    call    print_string

    call    read_long           // read integer
    mov     %rax,input1(%rip)   // store into input1

    lea     prompt2(%rip),%rdi  // print out prompt
    call    print_string

    call    read_long           // read integer
    mov     %rax,input2(%rip)

    add     input1(%rip),%rax
    mov     %rax,%rbx           // rbx = rax = input1+input2
//
// next print out result message as series of steps
//
    lea     outmsg1(%rip),%rdi
    call    print_string        // print out first message
    mov     input1(%rip),%rdi
    call    print_long          // print out input1
    lea     outmsg2(%rip),%rdi
    call    print_string        // print out second message
    mov     input2(%rip),%rdi
    call    print_long          // print out input2
    lea     outmsg3(%rip),%rdi
    call    print_string        // print out third message
    mov     %rbx,%rdi
    call    print_long          // print out sum (rbx)
    call    print_nl            // print new-line

    mov     $0,%eax             // return back to C
    pop     %rbx
    ret
