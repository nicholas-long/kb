#!/usr/bin/awk -f
# print all variations of spaces between tokens
function expand_rec(str, pos) {
  if (pos > NF) { # recursion base case - end of char array
    printf("%s\n", str "")
    return
  } else {
    expand_rec(str " " $pos, pos + 1)
    expand_rec(str "  " $pos, pos + 1)
    expand_rec(str "   " $pos, pos + 1)
    expand_rec(str "    " $pos, pos + 1)
  }
}
{
  expand_rec("", 1)
}
