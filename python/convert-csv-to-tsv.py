#!/usr/bin/python3
# convert CSV to TSV
import csv, sys
csv.writer(sys.stdout, dialect='excel-tab').writerows(csv.reader(sys.stdin))
