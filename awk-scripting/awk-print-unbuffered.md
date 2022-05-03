# awk print unbuffered output
put this action at the end of the script
or call `fflush()` after important prints.
```awk
{ fflush() }
```
