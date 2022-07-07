# wpscan

## initial
### vulnerable plugins
### vulnerable themes
### config backups
### database exports
### enumerate user id range
```bash
wpscan --url $URL -e vp,vt,cb,dbe,u1-10
```

## enumerate users
```bash
wpscan --url $URL -e u
```

## enumerate all plugins
```bash
wpscan --url $URL -e ap
```

### aggressive plugins-detection
```bash
wpscan --url $URL -e ap --plugins-detection aggressive
```

## brute force users file and password list
```bash
wpscan --url $URL -U users -P /usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt
```
