#!/bin/bash

# watch failed ssh login attempts as a live stream
# lookup unique hosts with shodan api
#cat /var/log/auth.log | \
tail -f '--lines=+1' /var/log/auth.log | \
  awk '/Connection closed by invalid user/ { print $12 }' | \
  awk '!seen[$0] {print; fflush()} {++seen[$0]}' | \
  awk '{system("shodan host " $1)}'
