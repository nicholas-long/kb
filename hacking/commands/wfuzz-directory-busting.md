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

# wfuzz fuzzing parameter names
```bash
wfuzz -c -w /usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt --hc 404 "http://$IP/location.php?FUZZ=sensible_value"
```

# wfuzz authenticated fuzzing parameter names
```bash
COOKIES="PHPSESSID=1234"
wfuzz -c -w /usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt -b "$COOKIES" --hc 404 "http://$IP/location.php?FUZZ=sensible_value"
```
