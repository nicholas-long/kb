# smbclient shell
## recursive list directory
```
recurse
dir
```

## recursive get all files
```
recurse on
prompt off
mget *
```

# smbclient
## null authentication
```bash
smbclient -N //$IP/share
```

## list Shares (As Guest)
```bash
smbclient -U guest -L //$IP
```

## connect to A Share (As User John)
```bash
smbclient \\\\$IP\\Users -U c.smith
```

## download All Files From A Directory Recursively
```bash
smbclient '\\server\share' -N -c 'prompt OFF;recurse ON;cd 'path\to\directory\';lcd '~/path/to/download/to/';mget *'
```

example:
```bash
smbclient \\\\$IP\\Data -U John -c 'prompt OFF;recurse ON;cd '\Users\John\';lcd '/tmp/John';mget *'
```

## alternate File Streams
List Streams

```bash
smbclient \\\\$IP\\Data -U John -c 'allinfo "\Users\John\file.txt"'
```

## download Stream By Name (:SECRET)
```bash
smbclient \\\\$IP\\Data -U John

get "\Users\John\file.txt:SECRET:$DATA"
```
