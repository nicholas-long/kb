#!/usr/bin/awk -f
/^".*[^"]$/ { quoting = 1 }
quoting {
  if (content) content = content ","
  content = content $0
}
!quoting { print }
quoting && /"$/ {
  quoting = 0
  print content
  content = ""
}
