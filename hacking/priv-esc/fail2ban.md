# fail2ban
- ssh is protected by default
- iptables-multiport.conf has default ban commands

## default config location
- /etc/fail2ban/action.d

## writable conf RCE
- edit `actionban` in a writable conf for rce
