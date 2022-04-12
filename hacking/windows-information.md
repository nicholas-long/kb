# location of services in windows registry
```powershell
cd HKLM:\SYSTEM\CurrentControlSet\Services\
```

# locations where authenticated users can write in windows
C:\windows\system32\spool\drivers\color
C:\windows\tasks

# windows directory traversal path traversal LFI strings
```
../
..\
..\/
%2e%2e%2f
%252e%252e%252f
%c0%ae%c0%ae%c0%af
%uff0e%uff0e%u2215
%uff0e%uff0e%u2216
..././
....\
```

# get windows enumeration info from file read
# get enumeration info from file read about level of patches installed on windows
WindowsUpdate.log
In newer windows systems, replaced with a boilerplate information file
```
Windows Update logs are now generated using ETW (Event Tracing for Windows).
Please run the Get-WindowsUpdateLog PowerShell command to convert ETW traces into a readable WindowsUpdate.log.
For more information, please visit https://go.microsoft.com/fwlink/?LinkId=518345
```
# get windows verison info from file read
system32\license.rtf will have version