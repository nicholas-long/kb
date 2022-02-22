# hashcat generate passwords from password masks and output to stdout
This example is piping the passwords into a loop to print their md5 sums and searching the resulting hashes, for fun
```bash
hashcat --force --stdout -a 3 '?d?d?d?d?l?l?l?l' | while read line; do echo -n $line | md5sum; done | grep 'bad\|a55'
```
