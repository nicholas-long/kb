# open multiple files within vim by adding args and converting into tabs
```vim
args *.sh
tab all
```
run `:tab all` to put the files in tabs

# find and edit files recursively with nvim in tabs
```bash
find . -type f -name '*.sh' | xargs nvim -p
```
