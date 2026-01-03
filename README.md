# 리눅스 시스템 디버깅
- 너구리 순진한 맛의 연습 공간
- https://www.inflearn.com/course/리눅스-시스템-디버깅

## Reference
- [PC Assebly Language](https://pacman128.github.io/pcasm/): Chapter 01 - 06
- [열씨미와 게을러의 리눅스 개발 노하우 탐험기](https://www.yes24.com/product/goods/2817871): Chapter 07
- [The Linux Kernel Module Programming Guide](https://sysprog21.github.io/lkmpg/): Chapter 13
- [Compiler Explorer](https://godbolt.org): HLL 로부터 다양한 아키텍쳐의 어셈블리어를 생성해 비교해 볼 수 있다.
- [Project F](https://projectf.io/): RISC-V Assembler 공개강좌

## x86_64

### 호출규약

|Register|Use|Saved By|
|-|-|-|
|**`%rax`**|Returning a value from a function|<span style="color:red">Caller</span>|
|**`%rbx`**|Optionally used as a base pointer|<span style="color:blue">Callee</span>|
|**`%rcx`**|Used to pass the 4<sup>th</sup> argument to a function|<span style="color:red">Caller</span>|
|**`%rdx`**|Used to pass the 3<sup>rd</sup> argument to a function & optionally to return a second value|<span style="color:red">Caller</span>|
|**`%rsp`**|Stack pointer||
|**`%rbp`**|Frame pointer|<span style="color:blue">Callee</span>|
|**`%rsi`**|Used to pass the 2<sup>nd</sup> argument to a function|<span style="color:red">Caller</span>|
|**`%rdi`**|Used to pass the 1<sup>st</sup> argument to a function|<span style="color:red">Caller</span>|
|**`%r8`**|Used to pass the 5<sup>th</sup> argument to a function|<span style="color:red">Caller</span>|
|**`%r9`**|Used to pass the 6<sup>th</sup> argument to a function|<span style="color:red">Caller</span>|
|**`%r10`**|Temporary register also used to pass a function's static chain pointer|<span style="color:red">Caller</span>|
|**`%r11`**|Temporary register|<span style="color:red">Caller</span>|
|**`%r12`**|Temporary register|<span style="color:blue">Callee</span>|
|**`%r13`**|Temporary register|<span style="color:blue">Callee</span>|
|**`%r14`**|Temporary register|<span style="color:blue">Callee</span>|
|**`%r15`**|Temporary register|<span style="color:blue">Callee</span>|

## aarch64

### 호출규약

|Register|Use|Saved By|
|-|-|-|
|**`x0`**-**`x7`**|Argument values passed to and results returned from a subroutine|<span style="color:red">Caller</span>|
|**`x8`**| Indirect return value address|<span style="color:red">Caller</span>|
|**`x9`**-**`x15`**|Local variables|<span style="color:red">Caller</span>|
|**`x16`** and **`x17`**|Intra-Procedure-call scratch registers|<span style="color:red">Caller</span>|
|**`x18`**|Platform register|<span style="color:red">Caller</span>|
|**`x19`**-**`x28`**||<span style="color:blue">Callee</span>|
|**`x29(FP)`**|Frame pointer|<span style="color:blue">Callee</span>|
|**`x30(LR)`**|Procedure link register|<span style="color:blue">Callee</span>|

## riscv64

### 호출규약

|Register|ABI Name|Use|Saved By|
|-|-|-|-|
|**`x0`**|**`zero`**|Hard-wired zero||
|**`x1`**|**`ra`**|Return address|<span style="color:red">Caller</span>|
|**`x2`**|**`sp`**|Stack pointer|<span style="color:blue">Callee</span>|
|**`x3`**|**`gp`**|Global pointer||
|**`x4`**|**`tp`**|Thred pointer||
|**`x5`**-**`x7`**|**`t0`**-**`t2`**|Temporaries|<span style="color:red">Caller</span>|
|**`x8`**|**`s0/fp`**|Saved register/frame pointer|<span style="color:blue">Callee</span>|
|**`x9`**|**`s1`**|Saved register|<span style="color:blue">Callee</span>|
|**`x10`** and **`x11`**|**`a0`** and **`a1`**|Function arguments/return values|<span style="color:red">Caller</span>|
|**`x12`**-**`x17`**|**`a2`**-**`a7`**|Function arguments|<span style="color:red">Caller</span>|
|**`x18`**-**`x27`**|**`s2`**-**`s11`**|Saved registers|<span style="color:blue">Callee</span>|
|**`x28`**-**`x31`**|**`t3`**-**`t6`**|Temporaries|<span style="color:red">Caller</span>|
