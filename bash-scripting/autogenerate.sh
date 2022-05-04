#!/bin/bash

grep -Rn '^# ' *.sh | awk -F: '
BEGIN {
  print "# bash scripting"
  print ""
}
{
  file=$1
  heading=$3
  print "#" heading
  print "```bash"
  system("cat " file)
  print "```"
  print ""
}
'
