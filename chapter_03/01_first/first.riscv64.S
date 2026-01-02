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
    addi    sp,sp,-32           // setup routine
    sd      ra,24(sp)
    sd      s0,16(sp)
    sd      s1,8(sp)
    sd      s2,0(sp)

    la      a0,prompt1          // print out prompt1
    jal     print_string

    jal     read_long           // read integer
    la      s2,input1
    sd      a0,0(s2)            // store into input1

    la      a0,prompt2
    jal     print_string

    jal     read_long
    la      s1,input2
    sd      a0,0(s1)            // a0 = input2

    ld      a5,0(s2)            // a5 = input1
    add     s0,a0,a5            // s0 = a0+a5, s0 = input2+input1
//
// next print out result message as series of steps
//
    la      a0,outmsg1
    jal     print_string
    ld      a0,0(s2)
    jal     print_long          // print out input1
    la      a0,outmsg2
    jal     print_string
    ld      a0,0(s1)
    jal     print_long          // print out input2
    la      a0,outmsg3
    jal     print_string
    mv      a0,s0
    jal     print_long          // print out sum (s0)
    jal     print_nl            // print new-line

    li      a0,0                // return back to C
    ld      ra,24(sp)
    ld      s0,16(sp)
    ld      s1,8(sp)
    ld      s2,0(sp)
    addi    sp,sp,32
    ret
