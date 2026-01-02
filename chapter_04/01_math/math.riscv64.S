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
    addi    sp,sp,-32
    sd      ra,24(sp)
    sd      s0,16(sp)
    sd      s1,8(sp)
    sd      s2,0(sp)

    la      a0,prompt
    jal     print_string

    jal     read_long
    la      s1,input
    sd      a0,0(s1)

    mul     s0,a0,a0            // s0 = input*input
    la      a0,square_msg
    jal     print_string
    mv      a0,s0
    jal     print_long
    jal     print_nl

    ld      s1,0(s1)            // s1 = input
    mul     s1,s1,s0
    la      a0,cube_msg
    jal     print_string
    mv      a0,s1
    jal     print_long
    jal     print_nl

    li      a0,25
    mul     s0,s1,a0
    la      a0,cube25_msg
    jal     print_string
    mv      a0,s0
    jal     print_long
    jal     print_nl

    li      a0,100
    div     s0,s1,a0
    rem     s1,s1,a0
    la      a0,quot_msg
    jal     print_string
    mv      a0,s0
    jal     print_long
    jal     print_nl
    la      a0,rem_msg
    jal     print_string
    mv      a0,s1
    jal     print_long
    jal     print_nl

    neg     s1,s1
    la      a0,neg_msg
    jal     print_string
    mv      a0,s1
    jal     print_long
    jal     print_nl

    li      a0,0
    ld      ra,24(sp)
    ld      s0,16(sp)
    ld      s1,8(sp)
    ld      s2,0(sp)
    addi    sp,sp,32
    ret
