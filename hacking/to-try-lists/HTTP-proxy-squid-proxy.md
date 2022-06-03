# HTTP proxy / squid proxy
- proxytunnel tool
- test if it can connect back to us - confirmation of usable proxy
- use metasploit module squid proxy scanner - more reliable
  - alternative bash script: search kb for "scan ports for websites through http proxy"
- scan for hidden local services - low priority
- scan local network - lowest priority
  - docker network interface `172.17.0.1/241` to `172.x/8`
- nmap over proxychains - really unreliable

