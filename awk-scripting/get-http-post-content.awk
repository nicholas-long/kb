#!/usr/bin/awk -f
# get HTTP POST content from HTTP request stream
#@pre: contains no CRLF
BEGIN { content=0 }
content { print }
/^$/ { content=1 }
