#!/usr/bin/awk -f
BEGIN {
  command = "stty size | awk '{print $2}'"
  command | getline cols
  close(command)
}
{
  spacing = ( cols - length() ) / 2
  for (i = 0; i < spacing; i++) printf " "
  print
}
