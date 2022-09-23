# ASCII text-based TSV / CSV file database

## join tables
both files must be sorted on join key
```bash
join -1 1 -2 3 <(sort data/completed_scanned_urls) <(sort -k 3 master-url-list.tsv)
```
