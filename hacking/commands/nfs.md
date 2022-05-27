# NFS

## Show mountable drives
```bash
showmount -e $IP
```

## Mount Drive
mkdir mpt
```bash
mount -t nfs -o soft $IP:/backup mpt/
```
