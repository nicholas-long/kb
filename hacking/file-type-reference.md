# pfx extension PKCS#12 format certificate
encrypted with password
A PFX file indicates a certificate in PKCS#12 format.
Think of it as an archive that stores everything you need to deploy a certificate.

## contents
- the certificate
- the intermediate authority certificate necessary for the trustworthiness of the certificate
- the private key to the certificate

## cracking with crackpkcs12
https://github.com/crackpkcs12/crackpkcs12
uses multiple cores for cracking.

### setup and install
depends on apt package `libssl-dev`
```bash
sudo apt install -y libssl-dev
git clone https://github.com/crackpkcs12/crackpkcs12
cd crackpkcs12
./configure
make
sudo make install
```

### A simple dictionary attack:
```bash
crackpkcs12 -d dictionary.txt certificate.pfx
```

### A simple brute force attack:
```bash
crackpkcs12 -b certificate.pfx
```
