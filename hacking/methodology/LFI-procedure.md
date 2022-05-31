# LFI or directory traversal procedures
Things that help get list of running processes
```
/proc/sched_debug
/proc/FUZZ/cmdline
/proc/self/cmdline
```
potential paths of running process in cmdline
fuzz `/proc/FUZZ/cmdline` for list of running processes

## environment variables
/proc/self/environ
protected in apache

## read scripts from web server process cwd
/proc/self/cwd
### fuzzing script names
/usr/share/seclists/Discovery/Web-Content/raft-small-words.txt
fuzz with known extensions
### downloading with curl 
#### prevent normalization of paths
curl parameter `--path-as-is` to preserve any `../`

## file wordlists
### linux
/usr/share/seclists/Discovery/Web-Content/LinuxFileList.txt
/usr/share/seclists/Fuzzing/LFI/LFI-gracefulsecurity-linux.txt
