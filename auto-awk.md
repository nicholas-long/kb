# awk scripting
## replace words with colorized versions
~/kb/awk-scripting/colorize.awk
```awk
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
```

## attempt to reuse credentials using hydra and keep track of usernames and passwords tried
## read and write a separated value file as a database
~/kb/awk-scripting/hydra-bruteforce-with-database.awk
```awk
#!/usr/bin/awk -f
# attempt to reuse credentials using hydra and keep track of usernames and passwords tried
# read and write a separated value file as a database
## pass in parameter "type"

BEGIN {
  tried_database = "cred.dat"
  to_try = "to.try"
  FS=":"
  while (getline < tried_database) {
    print $1, $2
    users[$1] = 1
    passwords[$2] = 1
    tried[$1 FS $2] = 1
  }
  close(tried_database)
}
type ~ /u/ { users[$0] = 1 }
type ~ /p/ { passwords[$0] = 1 }
END {
  for (u in users) {
    for (p in passwords) {
      cred = u FS p
      done = cred in tried
      if (!done) {
        print "Trying " cred
        print cred > to_try
        print cred >> tried_database
      }
    }
  }
  close(to_try)
  command = "hydra -C to.try ftp://localhost"
  print command
  while (command | getline) {
    if ($0 ~ /login:.*password:/){
      print # found a password
    }
  }
}
```

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

## get column headings from first line of CSV
~/kb/awk-scripting/get-columns.awk
```awk
#!/usr/bin/awk -f
# get column headings from first line of CSV
NR == 1 {
  for (i = 1; i < NF; i++) print i, $i
}
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

## constrict line widths of input text stream
~/kb/awk-scripting/line-lengths.awk
```awk
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

