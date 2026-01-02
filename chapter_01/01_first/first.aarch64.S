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
    adr     x0,integer1
    adr     x1,integer2
    ldr     x0,[x0]
    ldr     x1,[x1]
    add     x0,x0,x1
    adr     x1,result
    str     x0,[x1]
    mov     w0,#0
    ret
