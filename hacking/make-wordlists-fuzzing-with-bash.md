# make date wordlist for fuzzing with bash and parameter expansion
```bash
echo 2020-{01..12}-{01..31}
# convert date words into lines with bash
echo 2020-{01..12}-{01..31} | sed 's/ /\n/g'
```
