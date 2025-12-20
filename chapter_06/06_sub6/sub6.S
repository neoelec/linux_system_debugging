//
// file: sub6.S
// Subprogram to C interfacing example
//

// subroutine calc_sum
// finds the sum of the integers 1 through n
// Parameters:
//   rdi - n    - what to sum up to
// Return value:
//   value of sum
.text
.global calc_sum
//
// local variable:
//   sum at rdx
calc_sum:
    mov     $0,%rdx             // sum = 0
    mov     $1,%rax             // rax is i in pseudocode
.L_for_loop:
    cmp     %rdi,%rax
    jg      .L_end_for_loop

    add     %rax,%rdx
    inc     %rax
    jmp     .L_for_loop
.L_end_for_loop:

    mov     %rdx,%rax
    ret
