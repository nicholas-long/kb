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

# firefox containers
# mutliple sessions cookies in firefox web browser
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
