#argument: line
# awk -v line=205 -f print-markdown-content-nested-in-heading.md "$HOME/PayloadsAllTheThings/Methodology and Resources/Active Directory Attack.md"
/^#+ / { lastheading = length($1) } # save # of #s in heading
NR == line { 
  pr = 1
  h = lastheading
}
# stop when we reach heading of equal or greater importance (less #s)
!block && NR > line && /^#+ / && length($1) <= h { pr = 0 }
/```/ { block = !block } # toggle being inside a code block
pr == 1 { print }
