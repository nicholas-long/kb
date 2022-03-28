# make wordlists for fuzzing with bash
```bash
echo 2020-{01..12}-{01..31}
# convert date wordlist into lines with bash
echo 2020-{01..12}-{01..31} | sed 's/ /\n/g'
```
