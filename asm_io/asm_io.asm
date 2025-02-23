;
; file: asm_io.asm
; Assembly I/O routines

bits 64
default rel

        extern  __sub_dump_regs, __sub_dump_stack, __sub_dump_mem

segment .text
        global  sub_dump_regs, sub_dump_stack, sub_dump_mem

%macro push_caller 0
        pushfq
        push    r11
        push    r10
        push    r9
        push    r8
        push    rdi
        push    rsi
        push    rdx
        push    rcx
        push    rax
%endmacro

%macro pop_caller 0
        pop     rax
        pop     rcx
        pop     rdx
        pop     rsi
        pop     rdi
        pop     r8
        pop     r9
        pop     r10
        pop     r11
        popfq
%endmacro

%macro push_callee 0
        push    rsp
        push    rbp
        push    r15
        push    r14
        push    r13
        push    r12
        push    rbx
%endmacro

%macro pop_callee 0
        pop     rbx
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        pop     rbp
        pop     rsp
%endmacro

sub_dump_regs:
        push_callee
        push_caller
        mov     rdi, rsp
        call    __sub_dump_regs
        pop_caller
        pop_callee
        ret

sub_dump_stack:
        push_caller
        mov     rdi, rsp
        sub     rsp, 8
        call    __sub_dump_stack
        add     rsp, 8
        pop_caller
        ret

sub_dump_mem:
        push_caller
        mov     rdi, rsp
        sub     rsp, 8
        call    __sub_dump_mem
        add     rsp, 8
        pop_caller
        ret
