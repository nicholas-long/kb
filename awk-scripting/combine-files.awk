#!/usr/bin/awk -f
# combine lines from two files combinatorically with symbol between
BEGIN {
  if (!symbol) symbol = "\t"
}
ARGIND == 1 {
  lines[$0] = 1
}
ARGIND == 2 {
  for (c in lines) {
    printf "%s%s%s\n", c, symbol, $0
  }
}
