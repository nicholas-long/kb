# NMAP all ports command
```
nmap -p- -v -sC -sV $IP
```

# NMAP common ports command
```
nmap -v -sC -sV $IP
```

# NMAP extra options
- add `--open` to show only open ports
- add `-T5` to scan really fast

# nmap over proxychains using socks proxy
```
proxychains -q nmap -sC -sV -sT -Pn -n -vvv $IP
```


