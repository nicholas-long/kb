# convert

## package type to deb rpm slp lsb tgz
--to-deb              Generate a Debian deb package (default).
--to-rpm              Generate a Red Hat rpm package.
--to-slp              Generate a Stampede slp package.
--to-lsb              Generate a LSB package.
--to-tgz              Generate a Slackware tgz package.

```bash
sudo apt install -y alien
alien --to-deb file.rpm
```
