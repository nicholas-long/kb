#!/bin/bash

# watch failed ssh login attempts as a live stream
#cat /var/log/auth.log | \
tail -f /var/log/auth.log | \
  awk '/Connection closed by invalid user/ { print $12 }' | \
  awk '!seen[$0] {print} {++seen[$0]}' | \
  while read ip; do
    echo "$ip"
    shodan host "$ip"
    sleep 2
  done

