#!/usr/bin/python3

# convert tsv with key and value fields to python dictionary

from urllib.parse import unquote
params = {}
import fileinput
for rawline in fileinput.input():
    line = rawline.rstrip("\n")
    elems = line.split('\t')
    k = elems[0]
    v = elems[1]
    params[k] = v
print(repr(params))
