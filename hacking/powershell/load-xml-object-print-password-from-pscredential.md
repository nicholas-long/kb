# import xml object file load as PSCredential
```powershell
$cred = import-clixml .\file.xml
```

# print password from PSCredential object
```powershell
$cred.getnetworkcredential().password
```
