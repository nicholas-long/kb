# crackmapexec cme commands
crackmapexec --help
crackmapexec smb --help

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

## test combine valid user and password combinations
```
--no-bruteforce           No spray when using file for username and password (user1 => password1, user2 => password2
--continue-on-success     continues authentication attempts even after successes
```

```bash
crackmapexec smb $IP -u valid_users -p valid_passwords --no-bruteforce --continue-on-success
crackmapexec winrm $IP -u valid_users -p valid_passwords --no-bruteforce --continue-on-success
```

## enumerate shares accessable by user
```bash
crackmapexec smb $IP -u username -p password123 --shares
```

## enumerate acccess to files as json report
outputs to `/tmp/cme_spider_plus/$IP.json`
```bash
crackmapexec smb $IP -u username -p password123 -M spider_plus
```
