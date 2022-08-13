# enum4linux

## enumerate SMB shares and permissions
```bash
enum4linux -A $IP

```
## Scan Host
```bash
enum4linux $IP
```

### Suppress Errors
```bash
enum4linux $IP | grep -Ev '^(Use of)' > enum4linux.out 
```

# enum4linux-ng next gen
docker available
## default smb enumeration
```bash
git clone https://github.com/cddmp/enum4linux-ng
cd enum4linux-ng/
python3 enum4linux-ng.py -u guest $IP
```
