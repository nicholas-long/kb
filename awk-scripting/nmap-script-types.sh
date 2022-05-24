#!/bin/bash

grep -R 'categories *=' /usr/share/nmap/scripts | \
  awk -F: '
  BEGIN { OFS = ":" }
  $1 !~ /\/script\.db$/ {
    gsub(/categories *=/,"",$2)
    gsub(/[{}"'"'"']/,"",$2) # remove JSON-like lua chars
    gsub(/^ /,"",$2) # clear leading spaces
    gsub(/,/," ",$2) # commas -> spaces
    gsub(/  */," ",$2) # change multiple spaces to one
    print
  }
'
