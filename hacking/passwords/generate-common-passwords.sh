#!/bin/bash

# generate common passwords

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
  while read -r line; do
    echo "$line"
    echo "$line!"
    #echo "$line@"
    #echo "$line#"
    #echo "$line$"
    #echo "$line%"
    #echo "$line^"
    #echo "$line&"
    #echo "$line*"
    #echo "$line("
    #echo "$line)"
    #echo "$line-"
    #echo "$line="
  done
}

function passwordlists {
  cat /usr/share/wordlists/fasttrack.txt /usr/share/seclists/Passwords/Leaked-Databases/rockyou-05.txt | sort -u
}

function everything {
  (passwordlists && seasonyears) | sort -u | iterations
}

everything
