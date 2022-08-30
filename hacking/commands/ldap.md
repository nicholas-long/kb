# LDAP enumeration

## anonymous

### nmap scripts
```bash
nmap -n -sV --script "ldap* and not brute" $IP

# retrieve information for all objects ( default script capped at 20 )
nmap -n -sV --script "ldap* and not brute" --script-args 'ldap.maxobjects=-1' $IP | tee nmap-ldap.log
```
### python
```bash
ipython3

import ldap3
server = ldap3.Server(os.environ.get("IP"), get_info = ldap3.ALL, port = 389, use_ssl = False)
connection = ldap3.Connection(server)
connection.bind()
server.info
```

#### dump all object data
```
connection.search(search_base='DC=DOMAIN,DC=LOCAL', search_filter='(&(objectClass=*))', search_scope='SUBTREE', attributes='*')
```

## authenticated

### ldapdomaindump tool
creates json and html files in current directory
```bash
ldapdomaindump $IP -u 'DOMAIN.COM\USERNAME' -p 'PASSWORD123'
```
