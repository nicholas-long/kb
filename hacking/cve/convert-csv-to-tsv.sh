#!/bin/bash

## "Name","Status","Description","References","Phase","Votes","Comments"
zcat allitems.csv.gz | \
  ./trim.awk | \
  awk 'BEGIN { FS=",";OFS="\n";ORS="\n" } {$1 = $1; print;print ""}' | \
  ./fixquotes.awk | \
  ./strip.awk | \
  ./join.awk | \
  gzip > processed.gz
