# list dpkg packages installed on a certain date
```bash
cat dpkg.log | grep 'status installed' | awk /2-26/
```
