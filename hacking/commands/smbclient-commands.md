# smbclient shell
## smbclient recursive list directory
```
recurse
dir
```

## smbclient recursive get all files
```
recurse on
prompt off
mget *
```

# smbclient null authentication
```bash
smbclient -N //$IP/share
```
