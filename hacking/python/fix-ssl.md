# python fix SSL errors

## using requests library
add `verify=False` to each function call using requests (get, post)

### ignore errors
```python
import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
```
