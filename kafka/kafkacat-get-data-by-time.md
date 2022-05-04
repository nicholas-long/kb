# kafkacat get previous data in topic from epoch timestamp offset
kafkacat wants timestamps in ms, convert in bash.
```bash
d=$(date '+%s')
d=$(( d - 120 )) # 2 minutes ago
d=$(( d * 1000 )) # convert to ms
kafkacat -b kafka -C -t wifi-data-raw -e -o "s@$d"
```
