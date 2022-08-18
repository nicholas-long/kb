# windows API
## enable privilege
source: https://github.com/CsEnox/SeManageVolumeExploit/blob/main/SeManageVolumeExploit.c
```c
// Enabling Privilege
HANDLE hToken;
TOKEN_PRIVILEGES tkp;
OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken);
LookupPrivilegeValue(NULL, SE_MANAGE_VOLUME_NAME, &tkp.Privileges[0].Luid);
tkp.PrivilegeCount = 1;
tkp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
AdjustTokenPrivileges(hToken, FALSE, &tkp, 0, (PTOKEN_PRIVILEGES)NULL, 0);
```

### API calls
- OpenProcessToken
- LookupPrivilegeValue
  - edit value in `TOKEN_PRIVILEGES` struct
- AdjustTokenPrivileges
