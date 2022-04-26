# Alias for kcat
Use `-it` for interactive tty, or `-i` to pipe stuff.
If it complains about kafka's hostname, then you can use `--add-host kafka:127.0.0.1`
```bash
docker run --network host --rm -it edenhill/kcat:1.7.0 -b kafka:9092

alias kcat="docker run --network host --rm -i edenhill/kcat:1.7.0 -b kafka:9092"
```

# APT kafkacat
```bash
sudo apt install kafkacat
```

# Quick and dirty shell script
```bash
#!/bin/bash

docker run --network host --rm -i edenhill/kcat:1.7.0 -b kafka:9092 $@
```
