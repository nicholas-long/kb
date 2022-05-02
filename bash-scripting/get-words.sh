#!/bin/bash
# get words from file
while read line; do
  for word in $line; do
    echo $word
  done
done
