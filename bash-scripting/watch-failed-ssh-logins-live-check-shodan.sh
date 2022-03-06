#!/bin/bash

mkdir /tmp/shodancache

# watch failed ssh login attempts as a live stream
# lookup unique hosts with shodan api
#cat /var/log/auth.log | \
tail -f /var/log/auth.log | \
  grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | \
  while read ip; do
    echo "$ip"
    [ -f "/tmp/shodancache/$ip" ] || (shodan host "$ip" > /tmp/shodancache/$ip && sleep 2)
    bat --paging=never --language=markdown "/tmp/shodancache/$ip"
  done
  # filter unique
  #awk '!seen[$0] {print; fflush()} {++seen[$0]}' | \
