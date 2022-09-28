#!/bin/bash
# find the largest N files
# get argument value or default
find . -type f -ls 2>/dev/null |\
  awk '{print $7, $0}' |\
  sort -nr |\
  head -n ${1:-10} # default 10
