# python pwn tricks

## convert

### little endian bytes

#### to int
```python
int.from_bytes( these_bytes, 'little' )
```

#### to floating point
```python
import struct
value = struct.unpack('d', these_bytes)
```


### hex to int
```python
address = int(addr_hex,16)
```
