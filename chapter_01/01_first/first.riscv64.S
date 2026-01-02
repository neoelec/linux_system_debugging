.data
integer1:
    .quad   15                  // first int
integer2:
    .quad   6                   // second int

.bss
result:
    .skip   8                   // result

.text
.global  main
main:
    la      a0,integer1
    la      a1,integer2
    ld      a0,0(a0)
    ld      a1,0(a1)
    add     a0,a0,a1
    la      a1,result
    sd      a0,0(a1)
    li      a0,0
    ret
