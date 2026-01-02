//
// file: sub6.S
// Subprogram to C interfacing example
//

// subroutine calc_sum
// finds the sum of the integers 1 through n
// Parameters:
//   x0 - n    - what to sum up to
// Return value:
//   value of sum
.text
.global calc_sum
//
// local variable:
//   sum at x3
calc_sum:
    mov     x3,#0               // sum = 0
    mov     x2,#1               // x2 is i in pseudocode
.L_for_loop:
    cmp     x2,x0
    b.gt    .L_end_for_loop

    add     x3,x3,x2
    add     x2,x2,#0x1
    b       .L_for_loop
.L_end_for_loop:
    mov     x0,x3
    ret
