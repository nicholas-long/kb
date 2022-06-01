# bash scripting set operations

## comm

### find common lines between two files
input files must be sorted.
Explanation:
- suppress 1 ( lines unique to signups.txt )
- suppress 2 ( lines unique to purchases.txt )
```bash
comm -12 signups.txt purchases.txt
comm -12 <(sort signups.txt) <(sort purchases.txt)
```

### find lines unique to one file and not in another
input lines must be sorted.
Explanation:
- suppress 2 ( lines unique to purchases )
- suppress 3 ( lines common to both )
```bash
# display lines in signups that do not occur in purchases
comm -23 signups.txt purchases.txt
comm -23 <(sort signups.txt) <(sort purchases.txt)
```
