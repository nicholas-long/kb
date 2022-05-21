# nmap UDP scan - individual port scans
- snmp 161
  - faster to check with snmpwalk command than wait for UDP scan
- tftp 69
- dns 53
- rest of common

## top ports command
```bash
nmap -sU --top-ports 100 -v -oG top.100.udp $IP
```
