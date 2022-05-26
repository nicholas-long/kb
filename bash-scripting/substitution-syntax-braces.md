# bash scripting substitution syntax

## initialize variable with default value if empty and return it
```bash
echo ${name:="default"}
```

### example
```
$ echo ${name:="default"}
default
$ name=coyote
$ echo ${name:="default"}
coyote
```

## return variables value or default
```bash
echo ${name2:-"default"}
```

## return substring of name
format `$(variable:offset)` or `${variable:offset:length)`
zero indexed
```bash
echo ${name:2:2}
```

## read variable or else exit if undefined
```bash
echo ${param:?"param is required. exiting."}
```

## return something if another variable is set
If varname exists and isn’t null, return word; otherwise return null.
```bash
${varname:+word}
```
