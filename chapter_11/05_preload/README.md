## 11. UFTRACE

### uftrace 내부 구조

#### `mcount()` or `_mcount()`
- 아키텍쳐에 따라 `mcount()` 가 이용되는 경우도 있고, `_mcount()` 가 이용되는 경우도 있다.
- `HOST_ARCH` 환경변수를 이용해 플래그 처리를 할 수도 있지만, 그냥 `alias`를 사용한다.

```c
void mcount(void)
{
    printf("%s()\n", __func__);
}

void _mcount(void) __attribute__ ((alias ("mcount")));
```

#### x86_64 - `mcount()`
```
(gdb) disassemble main
Dump of assembler code for function main:
   0x00000000000011e4 <+0>:	push   %rbp
   0x00000000000011e5 <+1>:	mov    %rsp,%rbp
   0x00000000000011e8 <+4>:	call   0x1060 <mcount@plt>
   0x00000000000011ed <+9>:	lea    0xe10(%rip),%rdi        # 0x2004
   0x00000000000011f4 <+16>:	call   0x1030 <puts@plt>
   0x00000000000011f9 <+21>:	mov    $0x0,%eax
   0x00000000000011fe <+26>:	pop    %rbp
   0x00000000000011ff <+27>:	ret
End of assembler dump.
```

#### aarch64 - `_mcount()`
```
(gdb) disassemble main
Dump of assembler code for function main:
   0x0000000000000964 <+0>:	stp	x29, x30, [sp, #-16]!
   0x0000000000000968 <+4>:	mov	x29, sp
   0x000000000000096c <+8>:	xpaclri
   0x0000000000000970 <+12>:	mov	x0, x30
   0x0000000000000974 <+16>:	bl	0x7b0 <_mcount@plt>
   0x0000000000000978 <+20>:	adrp	x0, 0x0
   0x000000000000097c <+24>:	add	x0, x0, #0x9f0
   0x0000000000000980 <+28>:	bl	0x790 <puts@plt>
   0x0000000000000984 <+32>:	mov	w0, #0x0                   	// #0
   0x0000000000000988 <+36>:	ldp	x29, x30, [sp], #16
   0x000000000000098c <+40>:	ret
End of assembler dump.
```

#### riscv64 - `_mcount()`
```
(gdb) disassemble main
Dump of assembler code for function main:
   0x0000000000000896 <+0>:	addi	sp,sp,-16
   0x0000000000000898 <+2>:	sd	ra,8(sp)
   0x000000000000089a <+4>:	mv	a0,ra
   0x000000000000089c <+6>:	jal	0x780 <_mcount@plt>
   0x00000000000008a0 <+10>:	auipc	a0,0x0
   0x00000000000008a4 <+14>:	addi	a0,a0,48 # 0x8d0
   0x00000000000008a8 <+18>:	jal	0x770 <puts@plt>
   0x00000000000008ac <+22>:	li	a0,0
   0x00000000000008ae <+24>:	ld	ra,8(sp)
   0x00000000000008b0 <+26>:	addi	sp,sp,16
   0x00000000000008b2 <+28>:	ret
End of assembler dump.
```
