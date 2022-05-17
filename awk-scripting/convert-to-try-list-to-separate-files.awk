{ 
  line=$1
  filename="~/kb/hacking/to-try-lists/" $2 ".md"
  system("awk -f ~/kb/awk-scripting/print-markdown-content-nested-in-heading.awk -v line=" line " ~/kb/hacking/to-try-list.md > " filename)
}
