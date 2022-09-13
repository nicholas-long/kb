# bash tricks

## run a command / program in a pty to get color output
some programs hide color output when not connected to tty and writing or piping output.
make a pretend tty for them and log the output with `script` instead.

### shodan host
```bash
script -q output -c "shodan host 43.225.54.207" &
```

## check if current directory is writable
```bash
if [ -w "$(pwd)" ]; then
  echo "writing here"
fi
```
