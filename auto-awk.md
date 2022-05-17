# awk scripting
## print all variations of spaces between tokens
~/kb/awk-scripting/space-invader.awk
```awk
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
```

## print nested markdown content within headings
~/kb/awk-scripting/print-markdown-content-nested-in-heading.awk
```awk
# print nested markdown content within headings
#argument: line
#awk -v line=205 -f print-markdown-content-nested-in-heading.md "$HOME/PayloadsAllTheThings/Methodology and Resources/Active Directory Attack.md"
/^#+ / { lastheading = length($1) } # save # of #s in heading
NR == line { 
  pr = 1
  h = lastheading
}
/^$/ && pr { printedblank=1 }
## stop when we reach heading of equal or greater importance (less #s)
!block && NR > line && /^#+ / && length($1) < h { pr = 0 }
## stop if we reach another heading of equal importance if we've printed at least one blank line
printedblank && !block && NR > line && /^#+ / && length($1) == h { pr = 0 }
/^ *```/ { block = !block } # toggle being inside a code block
pr == 1 { print }
```

## check output of grep and next line using awk "grep -A 1 -R '^# ' ."
~/kb/awk-scripting/file-grep-multi-lines.awk
```awk
#!/usr/bin/awk -f
# check output of grep and next line using awk "grep -A 1 -R '^# ' ."
$0 == "--" {
  nextline=1
  lastpart=NR
}
NR == lastpart + 1 {
  header=$0
}
NR == lastpart + 2 && $0 ~ /-$/ {
  print header, $0
}
```

## print all variations of upper and lower case for given lowercase string
~/kb/awk-scripting/toggle-case-combinatoric.awk
```awk
#!/usr/bin/awk -f
# print all variations of upper and lower case for given lowercase string
function toggle_rec(str, arr, pos) {
  if (pos > length($0)) { # recursion base case - end of char array
    printf("%s\n", str)
    return
  } else {
    toggle_rec(str arr[pos], arr, pos + 1) # always proceed with original string
    if (arr[pos] ~ /[a-z]/) # only switch case on alphabets
      toggle_rec(str toupper(arr[pos]), arr, pos + 1)
  }
}
{
  split($0, chars, "")
  toggle_rec("", chars, 0)
}
```

## autogenerate headings for source files
~/kb/awk-scripting/autogenerate-headings-for-source-files.awk
```awk
# autogenerate headings for source files
{
  file=$1
  gsub(/\.\//, "", file)
  heading=$3
  if (file in headings) headings[file] = headings[file] "\n"
  headings[file] = headings[file] "#" heading
}
END {
  for (file in headings) {
    print headings[file]
    print "~/kb/" file
    print "```" lang
    system("cat " file)
    print "```"
    print ""
  }
}
```

## awk print markdown snippet text between backtick lines
~/kb/awk-scripting/snippet.awk
```awk
# awk print markdown snippet text between backtick lines
BEGIN { printing = 0 }
printing == 1 && $0 !~ /^```/ {print}
/^```/ {
  if (printing == 0) {
    printing = 1
  } else {
    printing = 0
  }
}
```

