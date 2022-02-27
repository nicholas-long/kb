# enumerate all python imports; chain 2 awk scripts with a filter
```bash
find / -name '*.py' -exec grep "" /dev/null {} \; 2>/dev/null | awk -F: '$2 ~ /import/ {print $1 "\t" $2}' | awk '{print $1,$3}'
```
