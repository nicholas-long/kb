#!/bin/bash

echo "#" $1
ext=$2
lang=$3

find . -name "*.$ext" | \
  sort -u | \
  xargs grep -Rn '^# ' | \
  awk -F: -f awk-scripting/autogenerate-headings-for-source-files.awk -v "lang=$lang"
