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
    stp     x29,x30,[sp,#-48]!  // setup routine
    mov     x29,sp
    stp     x19,x20,[sp,#16]
    stp     x21,x22,[sp,#32]

    adr     x0,prompt1          // print out prompt1
    bl      print_string

    bl      read_long           // read integer
    adr     x20,input1
    str     x0,[x20]            // store into input1

    adr     x0,prompt2
    bl      print_string

    bl      read_long
    adr     x22,input2
    str     x0,[x22]            // x0 = input2

    ldr     x21,[x20]           // x21 = input 1
    add     x21,x21,x0          // x21 = x21+x0, x21 = input2+input1
//
// next print out result message as series of steps
//
    adr     x0,outmsg1
    bl      print_string
    ldr     x0,[x20]
    bl      print_long          // print out input1
    adr     x0,outmsg2
    bl      print_string
    ldr     x0,[x22]
    bl      print_long          // print out input2
    adr     x0,outmsg3
    bl      print_string
    mov     x0,x21
    bl      print_long          // print out sum (x21)
    bl      print_nl            // print new-line

    mov     w0,#0               // return back to C
    ldp     x19,x20,[sp,#16]
    ldp     x21,x22,[sp,#32]
    ldp     x29,x30,[sp],#48
    ret
