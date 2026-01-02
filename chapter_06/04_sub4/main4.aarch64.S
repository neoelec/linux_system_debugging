//
// file: main4.S
// Multi-module subprogram example program
//

.data
sum:
    .quad   0

.bss
input:
    .skip   8

.text
.global main
main:
    stp     x29,x30,[sp,#-32]!
    mov     x29,sp
    stp     x19,x20,[sp,#16]

    mov     x20,#1              // x20 is 'i' in pseudo-code
.L_while_loop:
    adr     x19,input
    mov     x1,x19
    mov     x0,x20
    bl      get_long

    ldr     x0,[x19]
    cbz     x0,.L_end_while_loop

    adr     x19,sum
    ldr     x2,[x19]
    add     x0,x0,x2
    str     x0,[x19]
    add     x20,x20,#1
    b       .L_while_loop
.L_end_while_loop:

    adr     x0,sum
    bl      print_sum

    mov     w0,#0
    ldp     x19,x20,[sp,#16]
    ldp     x29,x30,[sp],#32
    ret
