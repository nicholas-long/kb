#!/bin/bash
# get raw HTTP request data from burp saved request
cat $1 | go run github.com/ericchiang/xpup@latest //request | base64 -d
