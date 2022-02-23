# check if a variable is empty

```bash
if [ -z "$KB_DIR" ]; then
  echo it is empty
fi
```

```
┌──(coyote㉿DESKTOP-14GJTFF)-[~/kb]
└─$ if [ -z "$KB_DIR" ]; then   echo it is empty; fi
it is empty

┌──(coyote㉿DESKTOP-14GJTFF)-[~/kb]
└─$ export KB_DIR=ok

┌──(coyote㉿DESKTOP-14GJTFF)-[~/kb]
└─$ if [ -z "$KB_DIR" ]; then   echo it is empty; fi

```

# check if a variable is empty { concise }
```bash
[[ -n $KB_DIR ]] || echo it is empty
```

```
┌──(coyote㉿DESKTOP-14GJTFF)-[~/kb]
└─$ [[ -n $KB_DIR ]] || echo it is empty
it is empty

┌──(coyote㉿DESKTOP-14GJTFF)-[~/kb]
└─$ export KB_DIR=ok

┌──(coyote㉿DESKTOP-14GJTFF)-[~/kb]
└─$ [[ -n $KB_DIR ]] || echo it is empty
```
