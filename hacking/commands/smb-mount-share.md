# smb mount share

## unauthenticated
```bash
sudo mount -t cifs //$IP/home /mnt/smb/home
sudo mount -t cifs -o username=user_name //$IP/share_name /mnt/
```

## old SMBv1 share
```bash
mount -t cifs -o vers=1.0,username=user_name //server_name/share_name /mnt/
```
