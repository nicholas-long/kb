#!/usr/bin/awk -f
BEGIN { OFS="\t" }
BEGINFILE {
  block = 0
  delete heading
}
!block && /^#+ / {
  level=length($1)
  heading[level]=$0
  fulltext=""
  for (n=1; n <= level; n++) {
    fulltext = fulltext " " heading[n]
  }
  print FILENAME, FNR, fulltext
}
/```/ { block = !block }
