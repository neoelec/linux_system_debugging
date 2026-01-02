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
    stp     x29,x30,[sp,#-48]!
    mov     x29,sp
    stp     x19,x20,[sp,#16]
    stp     x21,x22,[sp,#32]

    adr     x0,prompt1
    bl      print_string

    adr     x21,.L_ret1         // store return address into x21
    adr     x19,input1          // store address of input1 into x19
    b       get_long            // read integer
.L_ret1:
    adr     x0,prompt2
    bl      print_string

    adr     x21,.L_ret2
    adr     x19,input2
    b       get_long
.L_ret2:
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
//   x19 - address of qword to store integer into
//   x21 - address of instruction to return to
// Notes:
//   value of x0 is destroyed
get_long:
    bl      read_long
    str     x0,[x19]            // store input into memory
    br      x21                 // jump back to caller
