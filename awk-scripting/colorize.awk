#!/usr/bin/awk -f

# replace words with colorized versions

BEGIN {
  # color constants
  NORMAL = "\033[0m"
  BLACK = "\033[30m"
  BLUE = "\033[34m"
  RED = "\033[31m"
  MAGENTA = "\033[35m"
  GREEN = "\033[32m"
  CYAN = "\033[36m"
  YELLOW = "\033[33m"
  WHITE = "\033[37m"
}
{
  gsub(/root/, RED "root" NORMAL)
}
{ print }
