#!/usr/bin/python3

# parse all get parameters from a url

from urllib.parse import unquote
params = {}
s = input()
urlelems = s.split('?')
if len(urlelems) > 1:
    s = urlelems[1]
    for p in s.split('&'):
        elems = p.split('=')
        k = elems[0]
        if len(elems) > 1:
            v = elems[1]
            params[k] = unquote(v)
        else:
            params[k] = ''
print(repr(params))
