#!/usr/bin/awk -f
# combine lines with all previous lines combinatorically
{
  for (prev1 in seen) {
    print prev1 $0
  }
  seen[$0] = 1
}
