# jq

## pipe syntax
## filter objects syntax
filter data using pipes and select within jq command
```bash
cat users.json | jq '.data[].Properties | select ( .enabled == true ) | .name'
```
