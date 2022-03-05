# watch failed ssh login attempts as a live stream
```bash
tail -f /var/log/auth.log | awk '/Invalid user/ { print $8, $10 }'
```
