# bash scripting

## check if a variable is empty
```bash
if [ -z "$KB_DIR" ]; then
  echo it is empty
fi
```

### concise
```bash
[[ -n $KB_DIR ]] || echo it is empty
```
