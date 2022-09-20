# python scripting
## pwntools template binary exploit script
## test exploit locally
## connect to remote server
~/kb/hacking/pwn/boilerplate-pwn-script.py
```python
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
```

~/kb/hacking/pwn/boilerplate-pwn-script.py
## convert CSV to TSV
~/kb/python/convert-csv-to-tsv.py
```python
#!/usr/bin/python3
# convert CSV to TSV
import csv, sys
csv.writer(sys.stdout, dialect='excel-tab').writerows(csv.reader(sys.stdin))
```

~/kb/python/convert-csv-to-tsv.py
## parse a cookie from every line on standard input
~/kb/python/decode-cookies.py
```python
#!/usr/bin/python3

# parse a cookie from every line on standard input

from urllib.parse import unquote
params = {}
import fileinput
for rawline in fileinput.input():
    line = rawline.rstrip("\n")
    elems = line.split('=')
    k = elems[0]
    v = elems[1]
    params[k] = unquote(v)
print(repr(params))
```

~/kb/python/decode-cookies.py
## parse all get parameters from a url
~/kb/python/get-url-params.py
```python
#!/usr/bin/python3

# parse all get parameters from a url

from urllib.parse import unquote
params = {}
s = input()
urlelems = s.split('?')
if len(urlelems) > 1:
    s = urlelems[1]
    for p in s.split('&'):
        elems = p.split('=')
        k = elems[0]
        if len(elems) > 1:
            v = elems[1]
            params[k] = unquote(v)
        else:
            params[k] = ''
print(repr(params))
```

~/kb/python/get-url-params.py
## urlencode every input line
## read and process lines of input
~/kb/python/urlencode.py
```python
#!/usr/bin/python3
from urllib.parse import quote

# urlencode every input line

# read and process lines of input
import fileinput
for rawline in fileinput.input():
    line = rawline.rstrip("\n")
    print(quote(line))
```

~/kb/python/urlencode.py
## convert a GMSA managed password structure to a NTLM hash
~/kb/hacking/windows/convert-msds-managed-password-to-ntlm-hash.py
```python
#!/usr/bin/python3
# convert a GMSA managed password structure to a NTLM hash
## input file - managed_password.hex
## the value of msDS-ManagedPassword is decimal numbers representing bytes, one per line. convert to hex.
## $ cat managed_password | awk '{ printf("%.2x", $1) }' > managed_password.hex
## most of this taken from gMSADumper https://github.com/micahvandeusen/gMSADumper
## coyote0x90
from ldap3 import ALL, Server, Connection, NTLM, SASL, KERBEROS, extend, SUBTREE
import argparse
import binascii
from Cryptodome.Hash import MD4
from impacket.ldap.ldaptypes import ACE, ACCESS_ALLOWED_OBJECT_ACE, ACCESS_MASK, LDAP_SID, SR_SECURITY_DESCRIPTOR
from impacket.structure import Structure
import sys

class MSDS_MANAGEDPASSWORD_BLOB(Structure):
    structure = (
        ('Version','<H'),
        ('Reserved','<H'),
        ('Length','<L'),
        ('CurrentPasswordOffset','<H'),
        ('PreviousPasswordOffset','<H'),
        ('QueryPasswordIntervalOffset','<H'),
        ('UnchangedPasswordIntervalOffset','<H'),
        ('CurrentPassword',':'),
        ('PreviousPassword',':'),
        #('AlignmentPadding',':'),
        ('QueryPasswordInterval',':'),
        ('UnchangedPasswordInterval',':'),
    )

    def __init__(self, data = None):
        Structure.__init__(self, data = data)

    def fromString(self, data):
        Structure.fromString(self,data)

        if self['PreviousPasswordOffset'] == 0:
            endData = self['QueryPasswordIntervalOffset']
        else:
            endData = self['PreviousPasswordOffset']

        self['CurrentPassword'] = self.rawData[self['CurrentPasswordOffset']:][:endData - self['CurrentPasswordOffset']]
        if self['PreviousPasswordOffset'] != 0:
            self['PreviousPassword'] = self.rawData[self['PreviousPasswordOffset']:][:self['QueryPasswordIntervalOffset']-self['PreviousPasswordOffset']]

        self['QueryPasswordInterval'] = self.rawData[self['QueryPasswordIntervalOffset']:][:self['UnchangedPasswordIntervalOffset']-self['QueryPasswordIntervalOffset']]
        self['UnchangedPasswordInterval'] = self.rawData[self['UnchangedPasswordIntervalOffset']:]

f = open("managed_password.hex", "r")
mp_hex = f.read()
mp_bytes = bytes.fromhex(mp_hex)
f.close()

blob = MSDS_MANAGEDPASSWORD_BLOB()
blob.fromString(mp_bytes)
hash = MD4.new ()
hash.update (blob['CurrentPassword'][:-2])
ntlm = binascii.hexlify(hash.digest()).decode("utf-8")
print(ntlm)

```

~/kb/hacking/windows/convert-msds-managed-password-to-ntlm-hash.py
## fuzz valid dates
~/kb/hacking/tricks/python-fuzz-valid-dates.py
```python
from datetime import datetime, timedelta
# fuzz valid dates
dates = [(datetime.today() - timedelta(days=x)).strftime('%Y-%m-%d') for x in range(0, 365)]
for d in dates:
    print(d)
```

~/kb/hacking/tricks/python-fuzz-valid-dates.py
## convert tsv with key and value fields to python dictionary
~/kb/python/tsv-to-python-dict.py
```python
#!/usr/bin/python3

# convert tsv with key and value fields to python dictionary

from urllib.parse import unquote
params = {}
import fileinput
for rawline in fileinput.input():
    line = rawline.rstrip("\n")
    elems = line.split('\t')
    k = elems[0]
    v = elems[1]
    params[k] = v
print(repr(params))
```

~/kb/python/tsv-to-python-dict.py
## parse all post params from post content given on standard input
~/kb/python/decode-post-params.py
```python
#!/usr/bin/python3

# parse all post params from post content given on standard input

from urllib.parse import unquote
params = {}
s = input()
for p in s.split('&'):
    elems = p.split('=')
    k = elems[0]
    v = elems[1]
    params[k] = unquote(v)
print(repr(params))
```

~/kb/python/decode-post-params.py
