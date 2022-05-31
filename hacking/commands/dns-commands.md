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
