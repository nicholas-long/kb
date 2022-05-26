# powershell PSCredential password

## import xml object load from file
```powershell
$cred = import-clixml .\file.xml
```

## print password from object
```powershell
$cred.getnetworkcredential().password
```
