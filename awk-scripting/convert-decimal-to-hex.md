# convert decimal to hex
## GMSA managed password
read decimal numbers one per line, print as hex encoded bytes.
```bash
cat managed_password | awk '{ printf("%.2x", $1) }'
```
