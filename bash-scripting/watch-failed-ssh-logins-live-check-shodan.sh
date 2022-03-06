#!/bin/bash

# watch failed ssh login attempts as a live stream
# lookup unique hosts with shodan api

#cat /var/log/auth.log | \
tail -f /var/log/auth.log | \
  awk 'match($0, /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/) {
    ip = substr($0, RSTART, RLENGTH)
    if (seen[ip]) {
      if (last != ip) print "Already saw " ip
      last = ip
    } else {
      print ip
      ip = substr($0, RSTART, RLENGTH)
      seen[ip] = 1
      system("shodan host " ip)
    }
  }
  match($0, /[Ii]nvalid user (.+)/) {
    print substr($0, RSTART, RLENGTH)
  }'
