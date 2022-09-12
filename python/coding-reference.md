# python scripting

## requests http

### upload file
```
import requests
import sys

ip = sys.argv[1]
print("attacking " + ip)
url = f"http://{ip}/api/example"

files = {'file': ('filename_remote.txt', open('filename_local.txt','rb'), 'text/x-spam')}
r = requests.post(url, files=files)
print(r.text)
```

### cookies
```python
cookies = {'PHPSESSID':'cookies go here'}
r = requests.get(url, cookies=cookies)
```

### GET params
```python
params = {
    "ext": "",
    "show": final_payload
}
r = requests.get(url, cookies=cookies, params=params)
```

## argument variable argv
## format string variables
```python
import sys
ip = sys.argv[1]
url = f"http://{ip}/api/example"
```
