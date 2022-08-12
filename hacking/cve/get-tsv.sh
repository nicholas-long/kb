#!/bin/bash

# download the current CVE list get as Tab Separated Values

zcat <( curl https://cve.mitre.org/data/downloads/allitems.csv.gz ) | \
  sed 's/\t/  /g' | \
  ~/kb/python/convert-csv-to-tsv.py | \
  awk ' # fix quote issues
    BEGIN { OFS = FS = "\t" }
    {
      for (n = 1; n <= NF; n++) {
        if ($n ~ /^ *".*" *$/) {
          gsub(/^ *"/,"",$n)
          gsub(/" *$/,"",$n)
          gsub(/""/,"\"",$n)
        }
      }
    }
    { print } '
