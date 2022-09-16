# postgres sql enumeration
postgres client is `psql`

## list

### databases
```
\list
```

### tables and "relations"
```
\d
\dt
```

## exit
```
\q
```

## connect to database
```bash
psql -U username -d database_name
```

### using file socket
```bash
psql -h /var/opt/gitlab/postgresql -U gitlab gitlabhq_production
```
