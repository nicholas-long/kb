#!/bin/bash

# watch failed ssh login attempts as a live stream
# lookup unique hosts with shodan api
#cat /var/log/auth.log | \
tail -f '--lines=+1' /var/log/auth.log | \
  awk '/\]: Connection closed by/ { print $9 ; fflush() }' | \
  awk '/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/ { print; fflush() }' | \
  while read ip; do
    echo "$ip"
    shodan host "$ip"
    sleep 2
  done
  # filter unique
  #awk '!seen[$0] {print; fflush()} {++seen[$0]}' | \
