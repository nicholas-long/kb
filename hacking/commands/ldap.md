# LDAP enumeration

## anonymous

### nmap scripts
```bash
nmap -n -sV --script "ldap* and not brute" $IP
```

## authenticated

### ldapdomaindump tool
creates json and html files in current directory
```bash
ldapdomaindump $IP -u 'DOMAIN.COM\USERNAME' -p 'PASSWORD123'
```
