# two-factor authentication 2fa

## generate one time pins OTP

### google authenticator
the secret key is in base32 format
```bash
pip3 install oathtool
oathtool -b --totp ABCDEFGHABCDEFGH
```
