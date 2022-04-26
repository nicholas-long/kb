Get all dependencies for package

```
apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances bettercap | grep "^\w" | sort -u
#| xargs apt-get download 

# compress all packages into one tar archive
tar -czvf bettercap-pkg.tar *.deb
```

