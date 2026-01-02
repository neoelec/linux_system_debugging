//
// file: sub6.S
// Subprogram to C interfacing example
//

// subroutine calc_sum
// finds the sum of the integers 1 through n
// Parameters:
//   a0 - n    - what to sum up to
// Return value:
//   value of sum
.text
.global calc_sum
//
// local variable:
//   sum at x3
calc_sum:
    li      a4,0                // sum = 0
    li      a5,1                // a5 is i in pseudocode
.L_for_loop:
    blt     a0,a5,.L_end_for_loop

    add     a4,a4,a5
    addi    a5,a5,1
    j       .L_for_loop
.L_end_for_loop:
    mv      a0,a4
    ret
