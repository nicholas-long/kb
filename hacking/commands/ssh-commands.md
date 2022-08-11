# SSH arguments

## troubleshoot diagnose connection problems
connect with -vvv to see issues

## connect to old server
` -oKexAlgorithms=+diffie-hellman-group1-sha1 -c aes128-cbc `

## ssh `id_rsa` debug1 `send_pubkey_test` no mutual signature algorithm
## use old ssh-rsa RSA private key allow for connection
sha1 hashing used in `ssh-rsa` key type deprecated as of OpenSSH 8.8.
Add arguments
` -o 'PubkeyAcceptedKeyTypes +ssh-rsa' `

# ssh-keygen
## generate key to file no password prompt
```bash
ssh-keygen -N '' -f filename
```
