## 9. STRACE

### System Call Registers

#### x86_64
|Purpose|Register|
|-|-|
|System Call Number|`rax`|
|Argument 1|`rdi`|
|Argument 2|`rsi`|
|Argument 3|`rdx`|
|Argument 4|`r10`|
|Argument 5|`r8`|
|Argument 6|`r9`|
|Return Value|`rax`|

```c
        if (regs.orig_rax == SYS_openat) {
                /* snip */
                read_addr_into_buff(pid, regs.rsi, buff, 256);
                printf("openat(0x%llx, \"%s\", 0x%llx)", regs.rdi, buff,
                       regs.rdx);
```

```
openat(0xffffff9c, "/etc/ld.so.cache", 0x80000) -> rax = 3
openat(0xffffff9c, "/lib/x86_64-linux-gnu/libselinux.so.1", 0x80000) -> rax = 3
openat(0xffffff9c, "/lib/x86_64-linux-gnu/libcap.so.2", 0x80000) -> rax = 3
openat(0xffffff9c, "/lib/x86_64-linux-gnu/libc.so.6", 0x80000) -> rax = 3
openat(0xffffff9c, "/lib/x86_64-linux-gnu/libpcre2-8.so.0", 0x80000) -> rax = 3
openat(0xffffffffffffff9c, "/proc/filesystems", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/locale-archive", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/share/locale/locale.alias", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_IDENTIFICATION", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_IDENTIFICATION", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_MEASUREMENT", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_MEASUREMENT", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_TELEPHONE", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_TELEPHONE", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_ADDRESS", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_ADDRESS", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_NAME", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_NAME", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_PAPER", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_PAPER", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_MESSAGES", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_MESSAGES", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_MESSAGES/SYS_LC_MESSAGES", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_MONETARY", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_MONETARY", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_COLLATE", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_COLLATE", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_TIME", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_TIME", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_NUMERIC", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_NUMERIC", 0x80000) -> rax = 3
openat(0xffffff9c, "/usr/lib/locale/ko_KR.UTF-8/LC_CTYPE", 0x80000) -> rax = -2
openat(0xffffff9c, "/usr/lib/locale/ko_KR.utf8/LC_CTYPE", 0x80000) -> rax = 3
openat(0xffffff9c, ".", 0x90800) -> rax = 3
Makefile  README.md  bin  custom.cmm  my_strace.aarch64.c  my_strace.riscv64.c  my_strace.x86_64.c  obj
child 46868 was normal exit.
```

#### aarch64
|Purpose|Register(s)|
|-|-|
|System Call Number|`x8`|
|Arguments 0-8|`x0` - `x7`|
|Return Value|`x0` / `x1`|

```c
        if (regs.regs[8] == SYS_openat) {
                /* snip */
                read_addr_into_buff(pid, regs.regs[1], buff, 256);
                printf("openat(0x%llx, \"%s\", 0x%llx)", regs.regs[0], buff,
                       regs.regs[2]);
```

```
openat(0xffffffffffffff9c, "/etc/ld.so.cache", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/lib/aarch64-linux-gnu/libselinux.so.1", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/lib/aarch64-linux-gnu/libcap.so.2", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/lib/aarch64-linux-gnu/libc.so.6", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/lib/aarch64-linux-gnu/libpcre2-8.so.0", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/proc/filesystems", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/locale-archive", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/share/locale/locale.alias", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_IDENTIFICATION", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_IDENTIFICATION", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/aarch64-linux-gnu/gconv/gconv-modules.cache", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_MEASUREMENT", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_MEASUREMENT", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_TELEPHONE", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_TELEPHONE", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_ADDRESS", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_ADDRESS", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_NAME", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_NAME", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_PAPER", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_PAPER", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_MESSAGES", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_MESSAGES", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_MESSAGES/SYS_LC_MESSAGES", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_MONETARY", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_MONETARY", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_COLLATE", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_COLLATE", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_TIME", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_TIME", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_NUMERIC", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_NUMERIC", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, "/usr/lib/locale/C.UTF-8/LC_CTYPE", 0x80000) -> x0 = -2
openat(0xffffffffffffff9c, "/usr/lib/locale/C.utf8/LC_CTYPE", 0x80000) -> x0 = 3
openat(0xffffffffffffff9c, ".", 0x84800) -> x0 = 3
Makefile  README.md  bin  custom.cmm  my_strace.aarch64.c  my_strace.riscv64.c	my_strace.x86_64.c  obj
child 859 was normal exit.
```

#### riscv64
|Purpose|Register|ABI Name|
|-|-|-|
|System Call Number|`x17`|`a7`|
|Arguments 0-6|`x10` - `x16`|`a0` - `a6`|
|Return VAlue|`x10`|`a0`|

```c
        if (regs.a7 == SYS_openat) {
                /* snip */
                read_addr_into_buff(pid, regs.a1, buff, 256);
                printf("openat(0x%lx, \"%s\", 0x%lx)", regs.a0, buff, regs.a2);
```

```
openat(0xffffffffffffffda, "/etc/ld.so.cache", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/lib/riscv64-linux-gnu/libselinux.so.1", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/lib/riscv64-linux-gnu/libcap.so.2", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/lib/riscv64-linux-gnu/libc.so.6", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/lib/riscv64-linux-gnu/libpcre2-8.so.0", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/proc/filesystems", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/locale-archive", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/share/locale/locale.alias", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_IDENTIFICATION", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_IDENTIFICATION", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/riscv64-linux-gnu/gconv/gconv-modules.cache", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_MEASUREMENT", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_MEASUREMENT", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_TELEPHONE", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_TELEPHONE", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_ADDRESS", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_ADDRESS", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_NAME", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_NAME", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_PAPER", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_PAPER", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_MESSAGES", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_MESSAGES", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_MESSAGES/SYS_LC_MESSAGES", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_MONETARY", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_MONETARY", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_COLLATE", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_COLLATE", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_TIME", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_TIME", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_NUMERIC", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_NUMERIC", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, "/usr/lib/locale/C.UTF-8/LC_CTYPE", 0x80000) -> a0 = -2
openat(0xffffffffffffffda, "/usr/lib/locale/C.utf8/LC_CTYPE", 0x80000) -> a0 = 3
openat(0xffffffffffffffda, ".", 0x90800) -> a0 = 3
Makefile  README.md  bin  custom.cmm  my_strace.aarch64.c  my_strace.riscv64.c	my_strace.x86_64.c  obj
child 856 was normal exit.
```
