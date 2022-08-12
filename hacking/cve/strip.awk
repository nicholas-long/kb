#!/usr/bin/awk -f

/^".*"$/ {
  gsub(/^"/,"")
  gsub(/"$/,"")
  gsub(/""/,"\"")
  gsub(/\t/,"  ")
  #gsub(/  *\|  */, "\n| ")
  print
  next
}
{ print }
