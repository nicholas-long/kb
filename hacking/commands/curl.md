# curl

## scan ports for websites through http proxy
```bash
for p in $(~/kb/bash-scripting/nmap-get-top-ports.sh 20); do
  echo "### Scanning port $p"
  curl -v -x http://$IP:3128 http://$IP:$p/
done
```

## upload a file
the file is put into post parameter `myFile` the way php expects
```bash
curl -F myFile=@file.jpg http://$IP/upload.php
```
