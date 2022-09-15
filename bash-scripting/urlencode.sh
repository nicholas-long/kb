#!/bin/bash

# urlencode a line of text from stdin

python3 -c 'from urllib.parse import quote;print(quote(input()))'
