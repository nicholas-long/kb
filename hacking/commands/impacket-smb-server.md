# impacket quick smb server for file transfers in current directory
The share name is TMP
```bash
impacket-smbserver -smb2support TMP $(pwd)
```
