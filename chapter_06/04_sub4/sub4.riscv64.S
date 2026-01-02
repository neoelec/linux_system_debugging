//
// file: sub4.S
// Subprogram example
//

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
.global get_long
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
.global print_sum
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
