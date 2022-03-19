# wpscan enumerate users
```bash
wpscan --url http://$IP/ -e u
```

# wpscan enumerate all plugins
```bash
wpscan --url http://$IP/ -e ap
```

# wpscan aggressive enumerate all plugins plugins-detection
 all plugins
```bash
wpscan --url http://$IP/wordpress/ -e ap --plugins-detection aggressive
```
