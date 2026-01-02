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
    addi    sp,sp,-16
    sd      ra,8(sp)
    sd      s0,0(sp)

    la      a0,Message
    jal     print_string

    jal     read_long
    la      s0,Limit
    sd      a0,0(s0)

    li      a0,2
    jal     print_long
    jal     print_nl
    li      a0,3
    jal     print_long
    jal     print_nl

    li      a5,5
    la      s0,Guess
    sd      a5,0(s0)

.L_while_limit:
    la      s0,Guess
    ld      a0,0(s0)
    la      s0,Limit
    ld      a5,0(s0)
    blt     a5,a0,.L_end_while_limit

    li      a5,3                // a5 is factor = 3
 .L_while_factor:
    mul     a4,a5,a5
    bge     a4,a0,.L_end_while_factor
    rem     a4,a0,a5
    beq     a4,zero,.L_end_while_factor
    addi    a5,a5,2
    j       .L_while_factor
.L_end_while_factor:
    rem     a4,a0,a5
    beq     a4,zero,.L_end_if
    jal     print_long
    jal     print_nl
.L_end_if:
    la      s0,Guess
    ld      a0,0(s0)
    addi    a0,a0,2
    sd      a0,0(s0)
    j       .L_while_limit
.L_end_while_limit:

    li      a0,0
    ld      ra,8(sp)
    ld      s0,0(sp)
    addi    sp,sp,16
    ret
