# IPMI intelligent platform management interface
## zabbix
## BMC
## udp port 613
monitor / control physical hardware of server rack remotely.
IPMI protocol is vulnerable to bad challenge-response that leaks hashes.
sometimes vulnerable to auth bypass -> msf
zabbix stores configs to access mysql database

# systemd-private
systemd stores some directories in the /tmp directory that are like sandboxes for services.
these are tmp directories that belong to the individual services.

# block ciphers
## AES DES blowfish
### ECB CBC CFB OFB CTR cipher modes
- modes of operation
  - ECB
  - CBC
  - CFB
  - OFB
  - CTR
- Notable block ciphers
  - Lucifer / DES
  - IDEA
  - RC5
  - Rijndael / AES
  - Blowfish
the length of ciphertext encrypted with block mode is usually divisible by some power of 2
https://en.wikipedia.org/wiki/Block_cipher#Notable_block_ciphers

## CBC cipher cipher block chaining cipher mode of operation
block cipher
For the encryption of the initial block, an IV is generated.  This IV should be an unpredictable, unique value that is openly transmitted to the recipient.  It is not a secret.
This IV is XORed with the plaintext before passing it to the encryption algorithm.  The resulting ciphertext is then used to carry information to the encryption of the next block and so on.
https://www.ubiqsecurity.com/ecb-vs-cbc-block-cipher-mode-differences/
vulnerable
crackable?
brute forceable if used to generate a cookie

## ECB electronic code book cipher mode of operation
block cipher
all blocks are encrypted separately
same blocks yield same ciphertext
very vulnerable
crackable
replayable
can encrypt known string and xor to get cipher

# sperl and suidperl
variations of perl designed to handle setuid security properly

# firefox
## containers addon = multiple sessions cookies in firefox web browser
Firefox Multi-Account Containers
https://addons.mozilla.org/en-GB/firefox/addon/multi-account-containers/

# h2 database on tcp port 8082
java version of mysql database

# IPsec VPN UDP port 500 2500 strongswan
`strongswan` utility for connecting to ipsec VPNs
ike-scan
complicated - refer to ippsec "conceal" video

# solidity
Solidity is an object-oriented, high-level language for implementing smart contracts

# beacon object file BOF
run assemblies in memory within the c2 client process to avoid detection.
see section on ["run executable binary programs within process memory"](tricks/run-programs-in-memory.md)

# PXE boot
network storage provides ISO to boot

# httponly cookie option
httponly keeps javascript from accessing / stealing the cookie

# ansible
## How does Ansible work?
- YAML config files
- `Playbooks`   An ordered list of tasks along with its necessary parameters that define a recipe to configure a system.
- `Host`        A remote machine managed by Ansible.
- `Group`       Several hosts grouped together that share a common attribute.
- `Inventory`   A collection of all the hosts and groups that Ansible manages.
Could be a static file in the simple cases or we can pull the inventory from remote sources, such as cloud providers.
- `Modules`     Units of code that Ansible sends to the remote nodes for execution.
- `Tasks`       Units of action that combine a module and its arguments along with some other parameters.
- `Roles`       Redistributable units of organization that allow users to share automation code easier.

Ansible uses the concepts of control and managed nodes.
It connects from the control node, any machine with Ansible installed, to the managed nodes sending commands and instructions to them.
The units of code that Ansible executes on the managed nodes are called modules.
Each module is invoked by a task, and an ordered list of tasks together forms a playbook.
Users write playbooks with tasks and modules to define the desired state of the system.
https://spacelift.io/blog/ansible-tutorial
