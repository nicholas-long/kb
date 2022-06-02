#!/usr/bin/awk -f
# get column headings from first line of CSV
NR == 1 {
  for (i = 1; i < NF; i++) print i, $i
}
