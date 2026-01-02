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
    stp     x29,x30,[sp,#-32]!
    mov     x29,sp
    stp     x19,x20,[sp,#16]

    mov     x20,#1              // x20 is 'i' in pseudo-code
.L_while_loop:
    adr     x19,input
    mov     x1,x19
    mov     x0,x20
    bl      get_long

    ldr     x0,[x19]
    cbz     x0,.L_end_while_loop

    adr     x19,sum
    ldr     x2,[x19]
    add     x0,x0,x2
    str     x0,[x19]
    add     x20,x20,#1
    b       .L_while_loop
.L_end_while_loop:

    adr     x0,sum
    bl      print_sum

    mov     w0,#0
    ldp     x19,x20,[sp,#16]
    ldp     x29,x30,[sp],#32
    ret

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
