# linux hardening

## add hidepid to /proc at run time
```bash
mount -o remount,rw,hidepid=2 /proc
```
