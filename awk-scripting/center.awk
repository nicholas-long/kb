#!/usr/bin/awk -f
BEGIN {
  command = "stty size"
  command | getline
  rows = $1
  cols = $2
}
{
  #printf ("%" cols "s\n", $0)
  spacing = ( cols - length() ) / 2
  for (i = 0; i < spacing; i++) printf " "
  print
}
