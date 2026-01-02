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
    stp     x29,x30,[sp,#-48]!
    mov     x29,sp
    stp     x19,x20,[sp,#16]
    stp     x21,x22,[sp,#32]

    adr     x0,prompt
    bl      print_string

    bl      read_long
    adr     x20,input
    str     x0,[x20]

    mul     x19,x0,x0           // x19 = input*input
    adr     x0,square_msg
    bl      print_string
    mov     x0,x19
    bl      print_long
    bl      print_nl

    ldr     x22,[x20]           // x22 = input
    mul     x22,x22,x19
    adr     x0,cube_msg
    bl      print_string
    mov     x0,x22
    bl      print_long
    bl      print_nl

    mov     x0,#25
    mul     x19,x22,x0          // x19 = x22*25
    adr     x0,cube25_msg
    bl      print_string
    mov     x0,x19
    bl      print_long
    bl      print_nl

    mov     x0,#100
    sdiv    x19,x22,x0          // save quotient into x19
    msub    x20,x19,x0,x22      // save remainder into x20
    adr     x0,quot_msg
    bl      print_string
    mov     x0,x19
    bl      print_long
    bl      print_nl
    adr     x0,rem_msg
    bl      print_string
    mov     x0,x20
    bl      print_long
    bl      print_nl

    neg     x20,x20
    adr     x0,neg_msg
    bl      print_string
    mov     x0,x20
    bl      print_long
    bl      print_nl

    mov     w0,#0
    ldp     x19,x20,[sp,#16]
    ldp     x21,x22,[sp,#32]
    ldp     x29,x30,[sp],#48
    ret
