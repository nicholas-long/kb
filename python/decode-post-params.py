#!/usr/bin/python3

# parse all post params from post content given on standard input

from urllib.parse import unquote
params = {}
s = input()
for p in s.split('&'):
    elems = p.split('=')
    k = elems[0]
    v = elems[1]
    params[k] = unquote(v)
print(repr(params))
