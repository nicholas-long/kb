# data analysis commands

## dd copy from offset
count is not required - if omitted will copy to end of input
```bash
dd if=file.elf skip=22222 of=out.zip bs=1 count=100000
dd if=file.elf skip=22222 of=out.zip bs=1
```

## binwalk find and extract LZMA zip streams quickly
```bash
binwalk -Z -P -e IPWatcherSetup.exe
```
