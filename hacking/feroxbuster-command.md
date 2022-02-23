# big buster

```bash
feroxbuster --url http://$IP/ -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt -x php,txt,log
```

# initial directory list
```bash
feroxbuster --url http://$IP/ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt
```
