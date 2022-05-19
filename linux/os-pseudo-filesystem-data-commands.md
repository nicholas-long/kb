# linux assorted commands

## find disk mounting for root file system
```bash
mount | awk '$3 == "/" {print $1}'
ll $(mount | awk '$3 == "/" {print $1}')
```
