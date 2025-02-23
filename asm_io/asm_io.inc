        extern  read_long, print_long, print_string
        extern  read_char, print_char, print_nl
        extern  sub_dump_regs, sub_dump_mem, sub_dump_stack

%macro dump_regs 1
        pushfq
        push    rsp
        push    rbp
        push    %1
        call    sub_dump_regs
        add     rsp, 8
        pop     rbp
        add     rsp, 8
        popfq
%endmacro

;
; usage: dump_mem label, start-address, # paragraphs
%macro dump_mem 3
        pushfq
        push    rdi
        push    rdi                     ; dummy for alignment
        push    %3
        lea     rdi, [%2]
        push    rdi
        push    %1
        call    sub_dump_mem
        add     rsp, 8 * 4
        pop     rdi
        popfq
%endmacro

%macro dump_stack 3
        pushfq
        push    rsp
        push    rbp
        push    %3
        push    %2
        push    %1
        call    sub_dump_stack
        add     rsp, 8 * 3
        pop     rbp
        add     rsp, 8
        popfq
%endmacro
