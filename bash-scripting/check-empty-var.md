# check if a variable is empty

```bash
if [ $(echo -n "$KB_DIR" | wc -c) == 0 ]; then
  echo it is empty
fi
```

