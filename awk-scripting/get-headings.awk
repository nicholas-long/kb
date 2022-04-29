BEGIN { OFS="\t" }
!block && /^#+ / { print FILENAME, FNR, $0 }
/```/ { block = !block }
