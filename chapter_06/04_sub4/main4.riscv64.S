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
    addi    sp,sp,-32
    sd      ra,24(sp)
    sd      s0,16(sp)
    sd      s1,8(sp)

    li      s1,1                // s1 is 'i' in pseudo-code
.L_while_loop:
    la      s0,input
    mv      a1,s0
    mv      a0,s1
    jal     get_long

    ld      a4,0(s0)
    beqz    a4,.L_end_while_loop

    la      s0,sum
    ld      a5,0(s0)
    add     a5,a5,a4
    sd      a5,0(s0)
    addi    s1,s1,1
    j       .L_while_loop
.L_end_while_loop:

    la      a0,sum
    jal     print_sum

    li      a0,0
    ld      ra,24(sp)
    ld      s0,16(sp)
    ld      s1,8(sp)
    addi    sp,sp,32
    ret
