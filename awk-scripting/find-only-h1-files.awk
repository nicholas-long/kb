#!/usr/bin/awk -f
{
  FS="\t"
  filename=$1
  line=$2
  heading=$3
  sub(/^ /, "", heading)
  headingcount[filename]++
}
heading ~ /##/ { removed[filename] = 1 }
END {
  for (f in headingcount) if (!(f in removed) && headingcount[f] > 1) { 
    sub(/^\.\//,"", f)
    print f
  }
}
