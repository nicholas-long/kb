# php interactive shell
```bash
php -a
```

# php return directory as array
```php
scandir("/etc/passwd");
var_dump(scandir("/etc/passwd"));
```

# php read file
```php
file_get_contents("/etc/passwd");
var_dump(file_get_contents("/etc/passwd"));
```

# php write to file easy
```php
file_put_contents('/dest/file', 'file contents', FILE_APPEND);
```
