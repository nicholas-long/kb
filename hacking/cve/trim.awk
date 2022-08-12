#!/usr/bin/awk -f
BEGIN {
  FS = ","
}
pr && NR >= pr {
  print
}
# start printing after ,,,, line
$1 == "" { pr = NR + 1 }
