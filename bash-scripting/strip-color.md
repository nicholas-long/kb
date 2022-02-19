# pipe into sed command to strip color
```bash
sed 's/\x1B\[[0-9;]*[JKmsu]//g'
```
