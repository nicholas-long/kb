# vim edit multiple files

## add args while running and converting into tabs
## open multiple files
```vim
args *.sh
tab all
```
run `:tab all` to put the files in tabs

## find and edit files recursively open in tabs
```bash
find . -type f -name '*.sh' | xargs nvim -p
```
