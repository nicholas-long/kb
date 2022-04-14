# LDAP enumeration get root naming context FQDN domain names with ldapsearch
This will return the fully distinguished name.
```bash
ldapsearch -x -h $IP -s base namingcontexts
```

# LDAP enumeration dump LDAP with ldapsearch
```bash
ldapsearch -x -h $IP -b 'dc=example,dc=com'
```
