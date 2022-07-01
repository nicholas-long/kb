# feroxbuster

## dirbusting
```bash
export URL='http://$IP/'
feroxbuster --url $URL -w /usr/share/seclists/Discovery/Web-Content/common.txt
feroxbuster --url $URL -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt

# custom list
feroxbuster --url $URL -w ~/kb/wordlists/custom.dirbusting
```

### common with arguments
add slash with `-f`.
collect links with `-e`.
add words to wordlist with `-g`
```bash
feroxbuster --url http://$IP/ -w /usr/share/seclists/Discovery/Web-Content/common.txt
feroxbuster --url http://$IP/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -f
feroxbuster --url http://$IP/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -g -e -f
```

### big buster
```bash
feroxbuster --url http://$IP/ -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt -x php,txt,log
```

## files, backups, and extensions
the `--collect-extensions` option will add extensions from 403 errors as well and could get messy in combination other collection options.
using the default wordlist with `--collect-extensions` might not be adequate to find files - add known extensions.
```bash
feroxbuster --url http://$IP/ -B -E -g -e
# html and php extensions
feroxbuster --url http://$IP/ -B -E -g -x php,html -e
# with files wordlist
feroxbuster --url http://$IP/ -B -E -g -w /usr/share/seclists/Discovery/Web-Content/raft-medium-files.txt -e
feroxbuster --url http://$IP/ -B -g -w /usr/share/seclists/Discovery/Web-Content/raft-medium-files.txt -e
```
### fix recursion loop
avoid infinite loop created by combining 
```
403 errors 
+ discover words
+ backups 
+ verbose httpd errors
-----------------------
= infinite loop
```

### backups and extensions files command
```bash
feroxbuster --url $URL -x php -B -g
```

### small words to filenames plus extensions ignore 403 
```bash
feroxbuster --url http://$IP/ -B -g -w /usr/share/seclists/Discovery/Web-Content/raft-small-words.txt -x php,txt,xml,json,config -C 403 -C 404 -e
feroxbuster --url http://$IP/ -B -g -w /usr/share/seclists/Discovery/Web-Content/raft-small-words.txt -x txt,log -C 403 -C 404 -e
```

### dynamic collection settings
```
Dynamic collection settings:
    -B, --collect-backups
            Automatically request likely backup extensions for "found" urls

    -E, --collect-extensions
            Automatically discover extensions and add them to --extensions (unless they're in --dont-collect)

    -g, --collect-words
            Automatically discover important words from within responses and add them to the wordlist

    -I, --dont-collect <FILE_EXTENSION>...
            File extension(s) to Ignore while collecting extensions (only used with --collect-extensions)
```
