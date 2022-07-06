# generating enumeration wordlists

## exfiltrated passwd usernames to ssh key id_rsa fuzz list
```bash
awk -F: '{print $6 "/.ssh/id_rsa" }' passwd
```
