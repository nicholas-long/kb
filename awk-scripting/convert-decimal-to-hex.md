# convert GMSA managed password decimal numbers to hex
# convert decimal to hex
read decimal numbers one per line, print as hex encoded bytes.
```bash
cat managed_password | awk '{ printf("%.2x", $1) }'
```
