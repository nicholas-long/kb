# dump process memory

## with exe pseudofile ( simple )
```bash
cp /proc/$1/exe /tmp/exe
```

## with dd ( complicated )
```bash
dd if=/proc/$1/mem bs=$( getconf PAGESIZE ) iflag=skip_bytes,count_bytes skip=$(( 0x$a )) count=$(( 0x$b - 0x$a )) of="$1_mem_$a.bin"
```
