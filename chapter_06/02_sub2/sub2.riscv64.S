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
    addi    sp,sp,-32
    sd      ra,24(sp)
    sd      s0,16(sp)
    sd      s1,8(sp)
    sd      s2,0(sp)

    la      a0,prompt1
    jal     print_string

    la      a0,input1           // store address of input1 into a0
    jal     get_long            // read integer

    la      a0,prompt2
    jal     print_string

    la      a0,input2
    jal     get_long
    la      s0,input1
    ld      s1,0(s0)
    la      s2,input2
    ld      a5,0(s2)
    add     s1,s1,a5

    la      a0,outmsg1
    jal     print_string
    ld      a0,0(s0)
    jal     print_long
    la      a0,outmsg2
    jal     print_string
    ld      a0,0(s2)
    jal     print_long
    la      a0,outmsg3
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

//
// subprogram get_long
// Parameters:
//   a0 - address of word to store integer into
// Notes:
//   value of a0 is destroyed
get_long:
    addi    sp,sp,-16           // setup routine
    sd      ra,8(sp)
    sd      s0,0(sp)
    mv      s0,a0
    jal     read_long
    sd      a0,0(s0)            // store input into memory
    ld      ra,8(sp)
    ld      s0,0(sp)
    addi    sp,sp,16
    ret                         // jump back to caller
