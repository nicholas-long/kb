# crack salted md5 hash with hashcat
20: md5(salt.pass)
```bash
hashcat -m 20 hashes /usr/share/wordlists/rockyou.txt
```
hashes
```
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa:saltsaltsaltsalt
```
```
Hash mode #20
  Example.Hash........: 1169500a7dfece72e1f7fc9c9410867a:687430237020
  Example.Hash........: 2303b15bfa48c74a74758135a0df1201
  Example.Hash........: 63ec5f6113843f5d229e2d49c068d983a9670d02:57677783202322766743
```
