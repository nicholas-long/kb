# convert string to a base64 encoded UTF-16LE string to be used by powershell
```bash
iconv --to-code UTF-16LE | base64 -w0
```
