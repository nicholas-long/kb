#!/bin/bash
# get the date of the last commit to modify a file as epoch timestamp and iso date
while [[ $# -gt 0 ]]; do
  export filename=$1
  git log --date=unix -- "$1" | awk '
  BEGIN { OFS = "\t" }
  /^Date/ {
    epoch = $2
    "date --date @" epoch " --iso" | getline isodate
    print epoch, isodate, ENVIRON["filename"]
    exit 0
  }'
  shift
done
