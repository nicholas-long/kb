#!/usr/bin/awk -f
BEGIN {
  "printf 'yes\nno\n' | fzf" | getline choice
  print "you picked " choice
}
