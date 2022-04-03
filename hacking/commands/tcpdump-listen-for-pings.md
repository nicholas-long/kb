# listen for pings with tcpdump
```bash
sudo tcpdump -i tun0 icmp
sudo tcpdump -i tun0 icmp -v -n
```
option `-n` no dns resolution
option `-v` verbosity; add extra line with human-readable details
