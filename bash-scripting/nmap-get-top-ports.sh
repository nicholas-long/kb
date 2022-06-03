#!/bin/bash

# get top N most common ports from nmap list pass argument

nmap -vvv --top $1 -oG - 2>/dev/null | awk '
/Ports scanned:/ {
  split($4, arr, ";")
  csv=arr[2]
  gsub(/\)/, "", csv)
  gsub(/,/, "\n", csv)
  print csv
}
' | awk '
BEGIN {
  FS="-"
  OFS="\t"
}
{ $1=$1 }
!$2 { print } # print number
$2 { # print range
  for (n = $1; n <= $2; n++) print n
}
'
