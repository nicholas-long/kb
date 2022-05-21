# SNMP enumeration command

## snmpwalk 
in order to get meaningful names instead of snmp ID numbers, set up and configure:
- `apt install snmp-mibs-downloader`
- edit `/etc/snmp/snmp.conf`
  - comment out line `mibs: $`

```bash
snmpwalk -c public -v2c $IP
snmpwalk -c public -v1 $IP
```

## onesixtyone
```bash
onesixtyone $IP public
```

## enumerating / dumping interesting and categorized information
```bash
snmp-check $IP
```
