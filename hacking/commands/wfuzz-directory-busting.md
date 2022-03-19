# wfuzz dirbusting large directories wordlist
```bash
wfuzz -c -w /usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt --hc 404 http://$IP/FUZZ/
```

# wfuzz dirbusting large files wordlist
```bash
wfuzz -c -w /usr/share/seclists/Discovery/Web-Content/raft-large-files.txt --hc 404 http://$IP/FUZZ
```

# wfuzz dirbusting really really large directories wordlist
1273833 directory-list-2.3-big.txt
```bash
wfuzz -c -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt --hc 404 http://$IP/FUZZ
```
