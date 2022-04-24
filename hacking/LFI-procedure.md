# LFI procedures
Things that help get list of running processes
```
/proc/sched_debug
/proc/FUZZ/cmdline
/proc/self/cmdline
```
potential paths of running process
/proc/self/cmdline
fuzz `/proc/FUZZ/cmdline` for list of running processes
environ - protected in apache
/proc/self/environ
