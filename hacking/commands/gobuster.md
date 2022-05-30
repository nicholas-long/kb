# gobuster

## Fast Scan (Small List)
```bash
gobuster dir -e -u http://$IP -w /usr/share/wordlists/dirb/big.txt -t 20
```

## Fast Scan (Big List)
```bash
gobuster dir -e -u http://$IP -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 20
```

## Slow Scan (Check File Extensions)

```bash
gobuster dir -e -u http://$IP -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,txt,html,cgi,sh,bak,aspx -t 20
```

## fix HTTPS cert errors
Set the --insecuressl flag.

## vhost enumeration
```bash
gobuster vhost -u $URL -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -t 100
gobuster vhost -u $URL -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt -t 100
gobuster vhost -u $URL -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -t 100
```
