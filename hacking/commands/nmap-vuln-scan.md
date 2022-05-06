# scan SMB for vulnerabilities with nmap
```bash
nmap -p139,445 --script=smb-vuln-* $IP
nmap --script smb-vuln* $IP
```
