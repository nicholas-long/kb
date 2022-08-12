#!/usr/bin/awk -f
BEGIN {
  OFS = "\t"
  prevblank = 1
}
prevblank && /^CVE/ {
  line = NR
  cve = $0
}
NR == line + 1 { status = $0 }
NR == line + 2 { desc = $0 }
NR == line + 3 { ref = $0 }
NR == line + 4 { phase = $0 }
NR == line + 5 { votes = $0 }
NR == line + 6 { comments = $0 }
NR == line + 7 { print cve,status,desc,ref,phase,votes,comments }
/^$/ {
  prevblank = 1
  next
}
{ prevblank = 0 }
