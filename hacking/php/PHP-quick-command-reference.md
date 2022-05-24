# php

## run as interactive shell
```bash
php -a
```

# php code

## return directory as array
```php
scandir("/etc/passwd");
var_dump(scandir("/etc/passwd"));
```

## read file
```php
file_get_contents("/etc/passwd");
var_dump(file_get_contents("/etc/passwd"));
```

## write to file
Use "a" for append
```php
<?php
$myfile = fopen("newfile.txt", "w") or die("Unable to open file!");
$txt = "John Doe\n";
fwrite($myfile, $txt);
fclose($myfile);
?>
```
### easy file write
```php
file_put_contents('/dest/file', 'file contents', FILE_APPEND);
```

## embed file or multiline string as heredoc variable
```php
$fileContents = <<<'EOD'
here are the contents
EOD;
```
