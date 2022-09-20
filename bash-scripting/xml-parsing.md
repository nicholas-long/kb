# bash parse xml cli

## with xpath using xpup
```bash
go install github.com/ericchiang/xpup@latest
cat ./monitoring/login.req | ~/go/bin/xpup '//request'
```
