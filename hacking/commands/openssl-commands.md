# openssl commands

## encrypt file
```bash
openssl enc -aes-256-cbc -e -in $FILE -out outputfile -k password
```

## decrypt file
```bash
openssl enc -aes-256-cbc -d -in $FILE -out decryptedfile -k password
```
