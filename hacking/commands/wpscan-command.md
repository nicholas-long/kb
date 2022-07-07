# wpscan

## initial
### all plugins passive scan
### vulnerable themes
### config backups
### database exports
### enumerate user id range
```bash
wpscan --url $URL -e ap,vt,cb,dbe,u1-10
```

### aggressive plugins-detection
```bash
wpscan --url $URL -e ap --plugins-detection aggressive
```

## brute force users file and password list
```bash
wpscan --url $URL -U users -P /usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt
wpscan --url $URL -U users -P /usr/share/wordlists/rockyou.txt
```
