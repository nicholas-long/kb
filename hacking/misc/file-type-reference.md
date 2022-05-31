# pfx extension PKCS#12 format certificate
encrypted with password
A PFX file indicates a certificate in PKCS#12 format.
Think of it as an archive that stores everything you need to deploy a certificate.

## contents
- the certificate
- the intermediate authority certificate necessary for the trustworthiness of the certificate
- the private key to the certificate

## cracking

### with crackpkcs12
https://github.com/crackpkcs12/crackpkcs12
uses multiple cores for cracking.

### with johntheripper
convert with `pfx2john.py`
/usr/share/john/pfx2john.py
much faster than crackpkcs12
