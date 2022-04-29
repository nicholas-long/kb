#argument: line
#awk -v line=4 -f print-kb.awk test.md
BEGIN {
  block = 0
  pr = 0
}
NR == line { pr = 1 }
pr == 1 { print }
# toggle status of being in a block
/```/ { block = !block }
# stop pr when we hit a blank line not in a block
pr == 1 && block == 0 && $0 ~ /^$/ { pr = 0 }

