# nmap

## flags
`-sT` TCP connection scan : running -p- on sudo nmap could do UDP ports and is slow
`-sS` syn scan
`-sV` run version enumeration scripts
`--open` flag to sleep up scans
`-T5` or `--min-rate 10000` to increase scan rate
`-A` run "all" scripts
`-sC` equivalent to --script=default

### extra fast options
### increase speed
- add `--open` to show only open ports
- add `-T5` to scan really fast


## all ports command
```bash
sudo nmap -p- -v -sC -sV -oA nmap.all $IP
```

### quick
```bash
sudo nmap -p- -v -sT -sC -sV --min-rate 10000 -oA nmap.all $IP
```

## common ports command
```bash
nmap -v -sC -sV $IP
```

## over proxychains using socks proxy
```bash
proxychains -q nmap -sC -sV -sT -Pn -n -vvv $IP
```

## run "all" enumeration and scripts
```bash
nmap -v -p- -sV -sT -A $IP
```

## bruteforce HTTP authentication (including NTLM)
```bash
nmap --script http-brute -p 80 $IP
```

## check for mountable NFS shares
### test access
```bash
nmap --script "nfs-*" $IP
```

## run all service enumeration on a port
```bash
nmap -A -v -p 1234 $IP
```
