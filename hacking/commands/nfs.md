# NFS

## Show mountable drives
```bash
showmount -e $IP
```

## Mount Drive
mkdir mnt
```bash
mount -t nfs -o soft $IP:/backup mnt/
mount -t nfs -o nolock $IP:/backup mnt/
```
