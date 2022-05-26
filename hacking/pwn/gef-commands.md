# gef gdb plugin

## rop gadget search
gdb
```
ropper --search "pop r13"
```

## buffer overflow pattern create and offset
gdb
```
pattern create 200
pattern search $rsp
```
