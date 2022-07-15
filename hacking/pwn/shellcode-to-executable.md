# make executable binary with input shellcode
## msfvenom
```bash
cat payload.bin | msfvenom -p - -f exe -a x64 --platform win -o output.exe
```
