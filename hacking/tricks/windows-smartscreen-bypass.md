# windows executable smartscreen protection
protects user by only opening executables if they are signed.

## bypass ( apt 29 )
- include ISO in phishing mail
  - legit executable `OneDriveUpdater.exe`
  - malicious DLL `version.dll`
    - sideloaded into legit application
  - malicious LNK
    - shortcut to open the legit executable; target for user to click
