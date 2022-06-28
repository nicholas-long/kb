# dump process memory

## with sysinternals procdump
dump by process ID (ex: 1234)
```
procdump.exe -accepteula -ma 1234
procdump64.exe -accepteula -ma 1234
```

## with task manager as admin
right click process and select create dump file.
must be run as admin.
saves to `appdata/local/temp/procname.DMP`.
