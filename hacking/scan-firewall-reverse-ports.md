# scan for ports to connect back on through firewall
Attacker
```bash
sudo tcpdump -i tun0 'tcp[tcpflags] == tcp-syn'
```
Target
```bash
for i in {1..1000}; do nc -w 1 192.168.119.221 $i; echo $i; done
```
