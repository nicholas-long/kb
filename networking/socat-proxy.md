# Socat over proxy
Set up a local listener on port 5678 and connect to `$IP` `$PORT` using socks proxy `localhost:9050`
```bash
socat TCP4-LISTEN:5678,fork SOCKS4A:localhost:$IP:$PORT,socksport=9050
```
