# expect scripts

## record
```bash
autoexpect ssh user@$IP
```

## use arguments
```expect
set username [lindex $argv 0];
set password [lindex $argv 1];
```
This sets env-like variables that can be printed
```expect
send "$password"
```
