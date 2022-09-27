# linux capabilities

## inheritance after exec
capabilites are only inherited after exec if the target program has inherit capabilites set
example:
```bash
setcap cap_dac_override+pe ./registerdns  # pe flags say that running the program acquires the capability.
setcap cap_dac_override+i /usr/bin/net    # i flag says it's allowed to inherit the capability from the calling program.
```

## capability set `=ep`
inherits all capabilities
