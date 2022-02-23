# initialize variable with default value if empty and return it
```bash
echo ${name:="default"}
```

example
```
┌──(kali㉿kali)-[~/kb]
└─$ echo ${name:="default"}
default

┌──(kali㉿kali)-[~/kb]
└─$ name=coyote

┌──(kali㉿kali)-[~/kb]
└─$ echo ${name:="default"}
coyote
```

# return a variables value or a default value if not defined
```bash
echo ${name2:-"default"}
```

# return substring of name
format `$(variable:offset)` or `${variable:offset:length)`
zero indexed
```bash
echo ${name:2:2}
```

# read variable or else exit if undefined
```bash
echo ${param:?"param is required. exiting."}
```

# return something if another variable is set
If varname exists and isn’t null, return word; otherwise return null.
```bash
${varname:+word}
```

# template
```bash
```

