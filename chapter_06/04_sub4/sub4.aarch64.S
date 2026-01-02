//
// file: sub4.S
// Subprogram example
//

//
// subprogram get_long
// Parameters (in order pushed on stack)
//   x0 - number of input
//   x1 - address of word to store input into
// Notes:
//   values of x0 and x1 are destroyed
.data
prompt:
    .asciz  ") Enter an integer number (0 to quit): "

.text
.global get_long
get_long:
    stp     x29,x30,[sp,#-32]!
    mov     x29,sp
    str     x19,[sp,#16]
    mov     x19,x1

    bl      print_long

    adr     x0,prompt
    bl      print_string

    bl      read_long
    str     x0,[x19]

    ldr     x19,[sp,#16]
    ldp     x29,x30,[sp],#32
    ret

// subprogram print_sum
// prints out the sum
// Parameter:
//   x0 - sum to print out
// Note: destroys value of x0
//
.data
result:
    .asciz  "The sum is "

.text
.global print_sum
print_sum:
    stp     x29,x30,[sp,#-32]!
    mov     x29,sp
    str     x19,[sp,#16]
    mov     x19,x0

    adr     x0,result
    bl      print_string

    ldr     x0,[x19]
    bl      print_long
    bl      print_nl

    ldr     x19,[sp,#16]
    ldp     x29,x30,[sp],#32
    ret
