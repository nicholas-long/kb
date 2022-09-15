#!/usr/bin/python3
from urllib.parse import quote

# urlencode every input line

# read and process lines of input
import fileinput
for rawline in fileinput.input():
    line = rawline.rstrip("\n")
    print(quote(line))
