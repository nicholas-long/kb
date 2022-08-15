# python imports
## files vs loading as libraries
```python
import app.core.config # corresponds to app/core/config.py
```

## library search path
```
Python 2.7.9 (default, Aug 13 2016, 16:41:35)
[GCC 4.9.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import sys
>>> sys.path
['',
'/usr/lib/python2.7',
'/usr/lib/python2.7/plat-i386-linux-gnu',
'/usr/lib/python2.7/lib-tk',
'/usr/lib/python2.7/lib-old',
'/usr/lib/python2.7/lib-dynload',
'/usr/local/lib/python2.7/dist-packages',
'/usr/lib/python2.7/dist-packages',
'/usr/lib/pymodules/python2.7']
```

### print with python command
```
import sys
sys.path
```
