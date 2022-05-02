# john the ripper
## crack hashes from file with wordlist
```bash
john --wordlist=/usr/share/wordlists/rockyou.txt mypasswd
```

## use rules to crack hashes from file with wordlist
```bash
john --wordlist=password.lst --rules mypasswd
```

## find all file formats supported with a 2john script or tojohn
some are called "tojohn" as well"
### use sed to process / execute multiple expressions statements
```bash
locate 2john | sed -e 's/.*\///g' -e 's/\..*//g' -e 's/2john//g'
locate 2john | sed -e 's/.*\///g' -e 's/\..*//g'
```
