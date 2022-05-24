# metasploit msf

## run as script from rc file
```bash
msfconsole -r script.rc
```

## proxy exploits through burpsuite
```
set Proxies http:127.0.0.1:8080
```

# meterpreter msf

## move from x86 to x64
## migrate
1234 is the process id.
```
ps
migrate 1234
```

### local exploit suggester issues
after migration, local exploit suggester might not work properly. suggest starting metasploit as x64 machines.
