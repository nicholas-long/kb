# awk and bash scripting

## rename or move files
### automatically programatically generate file names
generate new file name from old name with awk strings
```bash
ls | awk '{ split($0,arr,"-"); system("mv " $0 " " arr[1] ".md") }'
```
