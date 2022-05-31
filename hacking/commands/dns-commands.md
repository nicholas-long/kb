# dns commands

## reverse lookup with dig
```bash
dig @$IP -x $LOOKUP_IP
```

## zone transfer axfr
```bash
dig axfr @$IP zonetransfer.me
```

## enumerate with ANY query
```bash
dig any @$IP zonetransfer.me
```

## update / change / delete DNS records for subdomain with nsupdate
### 86400 seconds = one day
```bash
nsupdate
server 1.2.3.4
update delete subdomain.example.com
send
update add subdomain.example.com 86400 A 10.10.69.69
send
quit
```
