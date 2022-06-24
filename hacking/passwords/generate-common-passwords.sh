#!/bin/bash

# generate common passwords

function awkuniq {
  awk '!seen[$0]++ {print}'
}

function years {
  year=$(date -I | cut -d '-' -f 1)
  echo $year
  for i in $(seq 1 5); do
    year=$(( $year - 1 ))
    echo $year
  done
}

function seasonyears {
  seasons="Spring Summer Autumn Fall Winter"
  lower=$(echo $seasons | tr '[:upper:]' '[:lower:]')
  seasons=$(echo "$seasons $lower")
  for y in $(years); do
    for s in $seasons; do
      echo "$s$y"
    done
  done
}

function iterations {
  awk '
  {
    print
    print $0 "!"
  }
  '
}

function passwordlists {
  cat /usr/share/wordlists/fasttrack.txt /usr/share/seclists/Passwords/Leaked-Databases/rockyou-05.txt | \
    awk '!seen[$0]++ {print}' # print unique
}

( seasonyears | iterations ; passwordlists ) | awkuniq
