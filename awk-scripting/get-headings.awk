#!/usr/bin/awk -f
BEGIN { OFS="\t" }
BEGINFILE { block = 0 }
!block && /^#+ / { print FILENAME, FNR, $0 }
/```/ { block = !block }
