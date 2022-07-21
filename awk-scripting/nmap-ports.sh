#!/bin/bash
# query nmap ports and service description definitions

awk '
BEGIN { OFS = "\t" }
/^#/ { next }
$1 == "unknown" { next }
{
  split($2,arr,"/")
  port=arr[1]
  proto=arr[2]
  print port, proto, $1
}
' /usr/share/nmap/nmap-services
