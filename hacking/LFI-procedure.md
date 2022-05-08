# LFI procedures
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
