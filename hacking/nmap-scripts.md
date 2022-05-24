# nmap scripts

## search by type
search for scripts of type "vuln"
```bash
~/kb/awk-scripting/nmap-script-types.sh | awk -F: '$2 ~ /vuln/'
```

## all script types
auth
broadcast
brute
default
discovery
dos
exploit
external
fuzzer
intrusive
malware
safe
version
vuln
