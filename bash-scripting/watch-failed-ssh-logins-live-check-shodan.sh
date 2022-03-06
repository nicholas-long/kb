#!/bin/bash

mkdir /tmp/shodancache

# watch failed ssh login attempts as a live stream
# lookup unique hosts with shodan api
#cat /var/log/auth.log | \
tail -f /var/log/auth.log | \
  awk 'match($0, /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/) {
    print substr($0, RSTART, RLENGTH)
    fflush()
  }' | \
  while read ip; do
    echo "$ip"
    [ -f "/tmp/shodancache/$ip" ] || (sleep 2 && shodan host "$ip" && sleep 2 && shodan host "$ip" > /tmp/shodancache/$ip)
    bat --paging=never --language=markdown "/tmp/shodancache/$ip"
  done
  # filter unique
  #awk '!seen[$0] {print; fflush()} {++seen[$0]}' | \
