#!/usr/bin/awk -f
# filter the CVE list for potentially valid, relevant vulnerabilities
BEGIN { OFS = FS = "\t" }
$3 ~ /^\*\* RESERVED/ { next }
$3 ~ /^\*\* REJECT/ { next }
#$3 ~ /^\*\* DISPUTED/ { next }
{ print }
