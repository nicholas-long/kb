#!/bin/bash

# generate ISO format dates wordlists for the last few years

for d in $(seq 2000);
do
  date --date "$d days ago" '+%Y-%m-%d'
done | awk ' BEGIN { FS="-" }
{ print > "days-" $1 } '
