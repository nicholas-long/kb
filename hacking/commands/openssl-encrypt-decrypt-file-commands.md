# openssl command to encrypt file
```bash
openssl enc -aes-256-cbc -e -in $FILE -out outputfile -k password
```
# openssl command to decrypt file
```bash
openssl enc -aes-256-cbc -d -in $FILE -out decryptedfile -k password
```
