#!/usr/bin/awk -f
# constrict line widths of input text stream
BEGIN {
  linemax = 50
}
{
  output = output $0
  while (length(output) > linemax) {
    print substr(output,1,linemax)
    output = substr(output,linemax+1)
  }
}
END {
  print output
}
