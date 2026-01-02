# 리눅스 시스템 디버깅
- 너구리 순진한 맛의 연습 공간
- https://www.inflearn.com/course/리눅스-시스템-디버깅

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
