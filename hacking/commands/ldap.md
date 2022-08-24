# LDAP enumeration

## anonymous

### nmap scripts
```bash
nmap -n -sV --script "ldap* and not brute" $IP

# retrieve information for all objects ( default script capped at 20 )
nmap -n -sV --script "ldap* and not brute" --script-args 'ldap.maxobjects=-1' $IP | tee nmap-ldap.log
```

## authenticated

### ldapdomaindump tool
creates json and html files in current directory
```bash
ldapdomaindump $IP -u 'DOMAIN.COM\USERNAME' -p 'PASSWORD123'
```
