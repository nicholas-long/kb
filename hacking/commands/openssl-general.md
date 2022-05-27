# openssl

## create a key 4096 bits
```bash
openssl genrsa -out client.key 4096
```

## create certificate signing request
```bash
openssl req -new -key client.key -out client.csr
```
need to enter country and organization information for the key

## sign a certificate signing request with the private key of a CA certificate authority
```bash
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -set_serial 9001 -extensions client -days 9002 -outform PEM -out client.cer
```
ca.crt is the certificate chain exported from firefox
ca.key is private key of a CA that has been leaked
client.csr is the certificate signing request

## convert certificate to PKCS12 format
```bash
openssl pkcs12 -export -inkey client.key -in client.cer -out client.p12
```
