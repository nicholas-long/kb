# wpscan enumerate users
```bash
wpscan --url http://$IP/ -e u
```

# wpscan enumerate all plugins
```bash
wpscan --url http://$IP/ -e ap
```

# wpscan aggressive enumerate all plugins plugins-detection
```bash
wpscan --url http://$IP/wordpress/ -e ap --plugins-detection aggressive
```

# brute force wpscan users file and password list
```bash
wpscan --url http://$IP/wordpress/ -U users -P /usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt
```
