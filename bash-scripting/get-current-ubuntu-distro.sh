#!/bin/bash

# return the most recently updated ubuntu distro
curl http://archive.ubuntu.com/ubuntu/dists/ 2>/dev/null | \
  awk 'BEGIN { FS="<td[^>]*>"; OFS="\t" } /a href/ && /folder.gif/ {print $3, $4}' | \
  sed -e 's/.*a href="//' -e 's/<[^>]*>//g' -e 's/\/".*\t/\t/' | \
  awk 'BEGIN {OFS=FS="\t"} $1 !~ /-/ { print $2, $1}' | \
  sort | \
  tail -n 1 | \
  awk 'BEGIN { FS="\t"} { print $2}'
