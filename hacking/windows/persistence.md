# establishing persistence on windows target in enterprise penetration test
- DLL sideloading common windows apps like OneDrive, Teams
These apps store executables in appdata and will load DLL payloads saved there.
Add wrapper functions to call real DLL.
This is currently very undetectable.
