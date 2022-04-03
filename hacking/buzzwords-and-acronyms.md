# zabbix
# BMC
# IPMI intelligent platform management interface
# udp port 613
monitor / control physical hardware of server rack remotely.
IPMI protocol is vulnerable to bad challenge-response that leaks hashes.
sometimes vulnerable to auth bypass -> msf
zabbix stores configs to access mysql database

# systemd-private
systemd stores some directories in the /tmp directory that are like sandboxes for services.
these are tmp directories that belong to the individual services.
