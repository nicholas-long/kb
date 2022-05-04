# decode hex on command line
```bash
xxd -r -ps
```

# encode string as base64 url encoded
```bash
tr '/+' '_-' | tr -d '='
base64 | tr '/+' '_-' | tr -d '='
```
