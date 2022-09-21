# awk scripting

## initialize TSV tab separated values
```awk
#!/usr/bin/awk -f
BEGIN { FS = "\t" }
```

### output
```awk
#!/usr/bin/awk -f
BEGIN { FS = OFS = "\t" }
```
