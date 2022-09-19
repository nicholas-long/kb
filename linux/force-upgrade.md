# upgrade when apt is causing problems
## force fix apt dpkg upgrade
```bash
sudo apt-get dselect-upgrade
```

## fix error "the following signatures couldn’t be verified because the public key is not available"
add the key to apt
```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABC123ABC123ABC1
```
