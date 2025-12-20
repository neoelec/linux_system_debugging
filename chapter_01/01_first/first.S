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
    mov     integer2(%rip),%rax
    add     integer1(%rip),%rax
    mov     %rax,result(%rip)
    mov     $0,%eax
    ret
