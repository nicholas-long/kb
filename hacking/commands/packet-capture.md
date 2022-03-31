# log packet capture pcap data with tcpdump
```bash
sudo tcpdump -i eth0 -w $FILE
```

# read packet capture pcap data with tshark
thsark and tcpdump both use `-r` to read file and `-w` to write file
```bash
tshark -r $FILE
```
