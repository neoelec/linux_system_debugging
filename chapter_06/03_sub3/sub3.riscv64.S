//
// file: sub3.S
// Subprogram example program
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

//
// subprogram get_long
// Parameters (in order pushed on stack)
//   a0 - number of input
//   a1 - address of word to store input into
// Notes:
//   values of a0 and a1 are destroyed
.data
prompt:
    .asciz  ") Enter an integer number (0 to quit): "

.text
get_long:
    addi    sp,sp,-16
    sd      ra,8(sp)
    sd      s0,0(sp)
    mv      s0,a1

    jal     print_long

    la      a0,prompt
    jal     print_string

    jal     read_long
    sd      a0,0(s0)

    ld      ra,8(sp)
    ld      s0,0(sp)
    addi    sp,sp,16
    ret

// subprogram print_sum
// prints out the sum
// Parameter:
//   a0 - sum to print out
// Note: destroys value of a0
//
.data
result:
    .asciz  "The sum is "

.text
print_sum:
    addi    sp,sp,-16
    sd      ra,8(sp)
    sd      s0,0(sp)
    mv      s0,a0

    la      a0,result
    jal     print_string

    ld      a0,0(s0)
    jal     print_long
    jal     print_nl

    ld      ra,8(sp)
    ld      s0,0(sp)
    addi    sp,sp,16
    ret
