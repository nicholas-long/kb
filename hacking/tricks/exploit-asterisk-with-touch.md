# Using touch to make files with strange names for exploiting scripts
Passing a parameter in quotes does not actually change the parameter, so `touch '--help'` is the same as `touch --help`
```
┌──(kali㉿kali)-[~/test2]
└─$ touch --help
Usage: touch [OPTION]... FILE...
Update the access and modification times of each FILE to the current time.
... snip ...
Full documentation <https://www.gnu.org/software/coreutils/touch>
or available locally via: info '(coreutils) touch invocation'

┌──(kali㉿kali)-[~/test2]
└─$ touch './--help'

┌──(kali㉿kali)-[~/test2]
└─$ ls
--help
```
` touch -- --help `
` touch './--help' `
