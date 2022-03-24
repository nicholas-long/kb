# NMAP all ports command
```bash
sudo nmap -p- -v -sC -sV -oA nmap.all $IP
```

# NMAP quick all ports command
```bash
sudo nmap -p- -v -sC -sV --min-rate 10000 -oA nmap.all $IP
```

# NMAP common ports command
```bash
nmap -v -sC -sV $IP
```

# NMAP extra options
- add `--open` to show only open ports
- add `-T5` to scan really fast

# nmap over proxychains using socks proxy
```bash
proxychains -q nmap -sC -sV -sT -Pn -n -vvv $IP
```


