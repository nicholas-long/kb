# pwn commands / tricks

## patchelf ld paths
### use custom ld version and library path
```
patchelf --set-interpreter ./lib64/ld-2.23.so --set-rpath ./lib64/ chapter2.patch
```
