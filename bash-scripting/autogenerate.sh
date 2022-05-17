#!/bin/bash

echo "#" $1
ext=$2

find . -name "*.$ext" | \
  xargs grep -Rn '^# ' | \
  awk -F: -f ~/kb/awk-scripting/autogenerate-headings-for-source-files.awk
