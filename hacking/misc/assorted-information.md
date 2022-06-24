# java serialization payload `rO0` base64 `AC ED 00 05` in hex
"rO0" Base64
"AC ED 00 05" in Hex

# python pickle serialization magic bytes header signature `80 03` `80 04` `80 05` `(dp0` base64 `gASV` `gAWV`
python2 pickles start like `(dp0` and end with `.`
python2 pickles start with hex `80 03` and end with `.`
`\x80\x02`
>-1 byte 0x2e Python pickle data, protocol version 2
`\x80\x03`
>-1 byte 0x2e Python pickle data, protocol version 3
`\x80\x04\x95`
>-1 byte 0x2e Python pickle data, protocol version 4
`\x80\x05\x95`
>-1 byte 0x2e Python pickle data, protocol version 5

# default openssl message digest
sha256

# log4j log4shell
the latest version of pimps/JNDI-Exploit-Kit is broken, go back to old versions
```bash
git clone https://github.com/pimps/JNDI-Exploit-Kit
git checkout 0b6925d80d453146db917616c521e7fc8419dbf7
```

# identifying type of encryption of unknown ciphertext
the length of ciphertext encrypted with block mode is usually divisible by some power of 2.
if you can roughly guess the size of the input text, you can try all the ciphers until you find one that produces the correct length of output ciphertext.
try oracle padding to brute force one byte at a time for block cipher encrypted cookies
try hash length extension

# problems/issues connecting through multiple VPNs tunnels MTU
try lowering MTU of the actual interface to accomodate packets with all the extra overhead of multiple VPN routing protocols
```bash
ifconfig tun0 MTU 1000
```

# compile windows c++ binaries on linux
```bash
sudo apt install mingw-w64
# build 32 bit windows DLL on linux and link winsock
x86_64-w64-mingw32-g++ rev.c -o rev.dll -lws2_32 -shared
```

# linux capability `=ep`
it grants all permissions.

# bloodhound sharphound fix import errors - incompatible versions
new version of bloodhound has to work with new version of sharphound (4).
ensure version of bloodhound is compatible with ingester.

# top tier endpoint protection AV defender
# Microsoft Defender for Endpoint - enterprise protection
# vmware carbon black cloud
# crowdstrike falcon
top tier endpoint protection AV

# cyber reason
B tier of AV

# arctic wolf
# mcaffee
# symantec
# sophos
# malwarebytes
worst tier of AV

# fastapi uvicorn put python webshells
# python uvicorn `--reload` flag
the `--reload` flag for uvicorn means python files can be updated and the server will reload the python

# default http config locations

## FreeBSD
/usr/local/etc/apache22/httpd.conf

# SMB
## fix `NT_STATUS_CONNECTION_DISCONNECTED` errors
To fix NT_STATUS_CONNECTION_DISCONNECTED errors in new Kali installations add client min protocol = NT1 to your \etc\samba\smb.conf file.

# burpsuite

## set scope to limit request catching
> "Target" panel
> "Scope" sub-panel
> add URL

## add header to forwarded requests, like X-Forwarded-For
- go to proxy tab -> options tab -> match and replace: click add
- add header in "Replace" field in format `Header: value`
- leave match condition field blank to add header instead of replacing one

# copy docker binary to target
can copy `docker` binary to target, but need to copy `com.docker.cli` as well
