# 8. PTRACE

## Process 메모리 쓰기

### 05_hello2
- 콘솔창을 하나 더 연 후, 05_hello2 를 먼저 실행한다.

```shell
make run
```

```
hello!
hello!
hello!
...
```

### 05_ptrace4
- 05_ptrac4를 실행해서 'hello!' 문자열이 저장된 주소를 알아낸다.

```shell
make ptrace
```

```
return : 0
stack = 0x7ffe92f88f50
...
00007ffe92f88fc0 : . . . . . . . . 0000000000000001
00007ffe92f88fc8 : q ! $ K . V . . 000056054b242171
00007ffe92f88fd0 : . . . . . . . . 0000000000000000
00007ffe92f88fd8 : p h e l l o ! . 00216f6c6c656870
00007ffe92f88fe0 : . . . . . . . . 00007ffe92f890f8
00007ffe92f88fe8 : . . , G . . . . 00007f0e472cfca8
00007ffe92f88ff0 : . . . . . . . . 00007ffe92f890e0
...
```

### 05_ptrace5
- 05_ptrac5을 실행 할 때, 05_ptrace4를 통해 알아낸 'hello!' 문자열의 주소를 `TARGET_ADDR=` 를 이용해 전달한다.
```shell
TARGET_ADDR=0x00007ffe92f88fd9 make ptrace
```

```
return : 0
stack = 0x7ffe92f88f50
```

```
...
hello!
hello!
hello!
AAA
AAA
AAA
...
```
