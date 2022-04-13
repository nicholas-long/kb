# openssl view information about certificate request
This works for openssl text like `BEGIN CERTIFICATE REQUEST`
```bash
openssl req -in $FILE -text
```

# openssl view public key of a private key
```bash
openssl pkey -in $FILE -pubout
```

# openssl view information about PKCS12 certificate
```bash
openssl pkcs12 -info -in $FILE
```
