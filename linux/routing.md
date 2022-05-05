# routing using a linux box
- enable ip forwarding
- add router to routes on hosts
- create iptables rule to forward between 2 interfaces

## enable ip forwarding

### temporarily
```bash
echo 1 > /proc/sys/net/ipv4/ip_forward
```

### permanently
edit `/etc/sysctl.conf`
Add one of the following lines to the bottom of the file, depending on whether you’d like Linux IP forwarding to be off or on, respectively. 
Then, save your changes to this file.
The setting will be permanent across reboots.
The net.ipv4.ip_forward setting controls whether IP forwarding is turned on or off for IPv4.
```
net.ipv4.ip_forward = 1
```
After editing the file, you can run the following command to make the changes take effect right away.
```
# sysctl -p
```

## add router to routes on hosts

### windows
192.168.1.69 is the router?
this forwards 10.10.10.0/24 through 192.168.1.69
```dos
route add 10.10.10.10 mask 255.255.255.0 192.168.1.69
route print
```

## iptables rules

### forward all traffic between two interfaces
```bash
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -i tun0 -o wlan0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i wlan0 -o tun0 -j ACCEPT
# from stackoverflow
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
# alternative: check source address is eth0 #ippsec video sharp
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o tun0 -j MASQUERADE
```
