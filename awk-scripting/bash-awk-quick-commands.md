# awk and bash scripting

## rename or move files
### automatically programatically generate file names
generate new file name from old name with awk strings
```bash
ls | awk '{ split($0,arr,"-"); system("mv " $0 " " arr[1] ".md") }'
```

## partition split into files by column value
### analyzing CSV trade data : split into files for symbols
### check if column is nonempty
### put row into file based on column value
```bash
cat trades-june1.csv| awk -F, 'length($4) { print > $4 ".csv" }'
```
