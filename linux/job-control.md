# linux job control

## background running process
- Ctrl-Z to suspend the process
- `bg` to resume the process in the background

## send background process to foreground
use percent sign and job number from the `jobs` command.
```bash
fg %1
```
