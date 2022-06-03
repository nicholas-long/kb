# bash commands

## curl

### scan ports for websites through http proxy
```bash
for p in $(~/kb/bash-scripting/nmap-get-top-ports.sh 20); do
  echo "### Scanning port $p"
  curl -v -x http://$IP:3128 http://$IP:$p/
done
```
