# windows XP and windows server 2003

## MOF file RCE
## arbitrary file write -> remote code execution
http://poppopret.blogspot.com/2011/09/playing-with-mof-files-on-windows-for.html
a MOF file that is put in the `%SystemRoot%\System32\wbem\mof\` directory is automatically compiled and registered into the WMI repository. ( in windows XP )
[...] MOF files are compiled into the WMI repository using mofcomp.exe.
this technique used by stuxnet. patched in later windows versions.
upload mof file -> callback should be relatively instantaneous

### metasploit
provided as a payload option for SMB servers in MSF `exploit/windows/smb/psexec`
uses function `generate_mof`
