# pwntools

## synchronizing output sending wait until receive
```
p.recvuntil('>')
p.sendlineafter(' ', payload)
```

## FmtStr automated format string exploitation
```python
# this function should send a whole format string input to the target
def exec_fmt(payload_input):
  pass

f = FmtStr(exec_fmt, offset=6)
```
