# generate cewl wordlist

## from website
default depth to follow links is 2. change with `-d`.
```bash
cewl http://$IP -w cewl_wordlist
cewl http://$IP -w cewl_wordlist_num --with-numbers
```

## from file

### using temporary http server
this looks kind of stupid, but it works surprisingly well
```bash
cd files # change to the dir with target files
python3 -m http.server 8000
# in another pane
cewl http://localhost:8000/ -w cewl_wordlist
```

### plaintext with grep
use awk to print only unique lines
```bash
grep -Eo '\w+' $FILE
grep -Eo '\w+' $FILE | awk '!(seen[$0]++)'
```
