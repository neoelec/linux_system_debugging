//
// file: prime.S
// This program calculates prime numbers
//

.data
Message:
    .asciz  "Find primes up to: "

.bss
Limit:
    .skip   8                   // find primes up to this limit
Guess:
    .skip   8                   // the current guess for prime

.text
.global main
main:
    stp     x29,x30,[sp,#-32]!
    mov     x29,sp
    str     x19,[sp,#16]

    adr     x0,Message
    bl      print_string

    bl      read_long
    adr     x19,Limit
    str     x0,[x19]

    mov     x0,#2
    bl      print_long
    bl      print_nl
    mov     x0,#3
    bl      print_long
    bl      print_nl

    mov     x0,#5
    adr     x19,Guess
    str     x0,[x19]

.L_while_limit:
    adr     x19,Guess
    ldr     x0,[x19]
    adr     x19,Limit
    ldr     x1,[x19]
    cmp     x0,x1
    b.gt    .L_end_while_limit

    mov     x1,#3               // x1 is factor = 3
 .L_while_factor:
    mul     x2,x1,x1
    cmp     x2,x0
    b.ge    .L_end_while_factor
    sdiv    x2,x0,x1
    msub    x2,x2,x1,x0
    cbz     x2,.L_end_while_factor
    add     x1,x1,#2
    b       .L_while_factor
.L_end_while_factor:
    sdiv    x2,x0,x1
    msub    x2,x2,x1,x0
    cbz     x2,.L_end_if
    bl      print_long
    bl      print_nl
.L_end_if:
    adr     x19,Guess
    ldr     x0,[x19]
    add     x0,x0,#2
    str     x0,[x19]
    b       .L_while_limit
.L_end_while_limit:

    mov     w0,#0
    ldr     x19,[sp,#16]
    ldp     x29,x30,[sp],#32
    ret
