## 7. BACKTRACE 구현

### Backtrace 구현 3
- riscv의 Stack Frame은 다른 아키텍쳐와 구조가 다르다.
  - 그림 출처: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/issues/437

```c
struct frame {
    struct frame *fp;
    void *ip;
};
```

|x86_64 and aarch64|riscv64|
|-|-|
|`FP`가 `struct frame` 의 **시작 주소** 가리킨다.|`FP`가 `struct frame` **시작 주소 + `sizeof(struct frame)`** 을 가리킨다.|
|![stack_frame_0](./img/stack_frame_0.png)|![stack_frame_1](./img/stack_frame_1.png)|

- 이러한 차이점으로, **Frame Pointer** 를 따라가는 Stack-Unwinding은 아래처럼 구현이 달라지게 된다.
  - riscv 의 경우 `1-object-offset)`을 빼준다.
<table>
<tr>
<td>
<b>x86_64</b>
</td>
<td>

```c
    __asm__ volatile("mov     %%rbp,%0" : "=r"(frame));

    while (frame < frame->fp && frame->ip > (void *)&__executable_start) {
        frame = frame->fp;
    }
```
</td>
</tr>
<tr>
<td>
<b>aarch64</b>
</td>
<td>

```c
    __asm__ volatile("mov     %0,fp" : "=r"(frame));

    while (frame < frame->fp && frame->ip > (void *)&__executable_start) {
        frame = frame->fp;
    }
```
</td>
</tr>
<tr>
<td>
<b>riscv64</b>
</td>
<td>

```c
    __asm__ volatile("mv      %0,fp" : "=r"(frame));
    frame -= 1;

    while (frame < frame->fp && frame->ip > (void *)&__executable_start) {
        frame = frame->fp - 1;    /* NOTE: */
    }
```
</td>
</tr>
</table>
