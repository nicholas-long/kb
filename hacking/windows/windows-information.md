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

# windows exploit unquoted service path meterpreter reverse service exe
use meterpreter format exe-service or meterpreter shell will die

# lsass process contains credentials
analyze process dump with pypykatz

# check network time offset with network time protocol NTP server on windows AD kerberos
# set date to match Active Directory server with ntpdate
```bash
sudo apt install ntpsec-ntpdate
# query date
ntpdate -q $IP
# update local date to match server
sudo ntpdate $IP
```

# change user password
## powershell or dos
```
net user AccountUsername P@ssw0rd1
net user AccountUsername P@ssw0rd1 /domain
```

# windows reverse shell AV bypass
## active directory endpoint protection
## defender
try changing variable names
try removing "PS" and path from prompt

# windows alternate data streams commands
## enumerate directory for alt streams
```dos
dir /r
```

## creating alt streams
```
echo <YOUR DATA> > filename.txt:streamname.txt
```

# exploiting SeRestorePrivilege
https://github.com/xct/SeRestoreAbuse
Executes a command as SYSTEM when SeRestorePrivilege is assigned.
In case it's disabled, the program will enable it for you.

# create windows backdoor accounts
a local admin added to domain controller should be able to authentice to SMB on the DC (not local auth).
password policy might be different on local machine vs. domain.

# dumping credentials as admin

## in remote desktop RDP or GUI
- task manager > details > lsass.exe
- create dump file

# program files ruxim directory
# program files UNP directory
used for windows update

# hidden shares
shares with a `$` at the end of the name are hidden by default on windows

# applocker limit allowed executables and allowed paths
## bypass executable blocking
`C:\Windows\Tasks` is usually world writable and bypasses default restrictions on executables running from `C:\Windows`

# fix downloading file with evil-winrm
use absolute path to file

# windows shell manipulate and privesc with process tokens
https://github.com/0xbadjuju/Tokenvator
