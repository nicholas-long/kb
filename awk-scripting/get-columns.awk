#!/usr/bin/awk -f
# get column headings from first line of CSV
NR == 1 {
  split($0, arr, ",")
  for (i = 1; i < length(arr); i++) {
    print i, arr[i]
  }
}
