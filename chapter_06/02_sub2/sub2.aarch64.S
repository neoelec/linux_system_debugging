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
    stp     x29,x30,[sp,#-48]!
    mov     x29,sp
    stp     x19,x20,[sp,#16]
    stp     x21,x22,[sp,#32]

    adr     x0,prompt1
    bl      print_string

    adr     x0,input1           // store address of input1 into x0
    bl      get_long            // read integer

    adr     x0,prompt2
    bl      print_string

    adr     x0,input2
    bl      get_long
    adr     x20,input1
    ldr     x21,[x20]
    adr     x22,input2
    ldr     x0,[x22]
    add     x21,x21,x0

    adr     x0,outmsg1
    bl      print_string
    ldr     x0,[x20]
    bl      print_long
    adr     x0,outmsg2
    bl      print_string
    ldr     x0,[x22]
    bl      print_long
    adr     x0,outmsg2
    bl      print_string
    mov     x0,x21
    bl      print_long
    bl      print_nl

    mov     w0,#0
    ldp     x19,x20,[sp,#16]
    ldp     x21,x22,[sp,#32]
    ldp     x29,x30,[sp],#48
    ret

//
// subprogram get_long
// Parameters:
//   x0 - address of word to store integer into
// Notes:
//   value of x0 is destroyed
get_long:
    stp     x29,x30,[sp,#-32]!  // setup routine
    mov     x29,sp
    str     x19,[sp,#16]
    mov     x19,x0
    bl      read_long
    str     x0,[x19]            // store input into memory
    ldr     x19,[sp,#16]
    ldp     x29,x30,[sp],#32
    ret                         // jump back to caller
