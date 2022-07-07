# packet capture

## with tcpdump
### log data to pcap file
```bash
sudo tcpdump -i tun0 -w $FILE
```

### watch traffic
#### print IP and port
```bash
sudo tcpdump -n -i tun0
```

#### print packet data contents
```bash
sudo tcpdump -A -n -i tun0
```

## read pcap data with tshark
thsark and tcpdump both use `-r` to read file and `-w` to write file
```bash
tshark -r $FILE
```

## capture packets with tcpdump over ssh connection and pipe directly to wireshark
run tcpdump as an ssh command and pipe to stdout.
pipe into wireshark through stdin. wireshark interface `-` is stdin.
example on ippsec video lightweight.
-U                prints to stdout and flushes buffer on packet boundaries instead of lines
-s0               snap length 0
`-w -`            write to stdout
positional arg    filter expression
```bash
ssh user@$IP "/usr/bin/tcpdump -i lo -U -s0 -w - 'not port 22'" | wireshark -k -i -
```
