#!/bin/bash

xpup="go run github.com/ericchiang/xpup@latest"
file="$1"
http_request=$(mktemp)

# parse burpsuite saved request file and convert to python requests script for copying
cat $file | $xpup '//request' | base64 -d > $http_request
dos2unix $http_request 2>/dev/null

url=$(cat $file | $xpup //url)
ct=$(awk '/^Content-Type/ { print $2 }' $http_request)
method=$(awk 'NR == 1 { print $1 }' $http_request)
getparams=$(echo $url | ~/kb/python/get-url-params.py)
http_headers=$(awk '
  BEGIN {
    FS = ": "
    OFS = "\t"
  }
  /^Cookie/ { next }
  /^Host/ { next }
  /^Content-Length/ { next }
  /^Connection/ { next }
  /^Upgrade-Insecure-Requests/ { next }
  /^Accept/ { next }
  /^Content-Type/ { next }
  NF == 2 { $1 = $1; print }
  /^$/ { exit 0 }
  ' $http_request | ~/kb/python/tsv-to-python-dict.py
)

cookies=$(awk '
/^Cookie/ {
  gsub(/;/,"")
  for (n = 2; n <= NF; n++)
    print $n
}
' $http_request | ~/kb/python/decode-cookies.py)

#--------------------------------------------------------------------------------

cat << HEADER
import requests

url = "$url"
cookies = $cookies

## optional
getparams = $getparams
headers = $http_headers

HEADER

if [ $method == "POST" ]; then
  if [ $ct == "application/x-www-form-urlencoded" ]; then
    postdata=$(~/kb/awk-scripting/get-http-post-content.awk $http_request | ~/kb/python/decode-post-params.py)

    cat << PYTHON
postdata = $postdata
r = requests.post(url, data=postdata, headers=headers, cookies=cookies)
PYTHON
  fi
elif [ $method == "GET" ]; then
    cat << PYTHON
r = requests.get(url, params=getparams, headers=headers, cookies=cookies)
PYTHON
fi

cat << FOOTER
print(r.text)
FOOTER

rm $http_request
