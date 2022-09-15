# gobuster

## dirbusting
```bash
gobuster dir -e -t 50 -u $URL -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt
gobuster dir -e -t 50 -u $URL -w /usr/share/wordlists/dirb/big.txt
gobuster dir -e -t 50 -u $URL -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
gobuster dir -e -t 50 -u $URL -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt
gobuster dir -e -t 50 -u $URL -w /usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt
gobuster dir -e -t 50 -u $URL -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt

gobuster dir -e -t 50 -u $URL -w /usr/share/seclists/Discovery/Web-Content/Common-DB-Backups.txt

gobuster dir -e -t 50 -u $URL -w ~/kb/wordlists/custom.dirbusting
gobuster dir -e -t 50 -u $URL -w /usr/share/seclists/Discovery/Web-Content/common.txt
```

## scan files and discover backups
exclude error pages with `--exclude-length 321` instead of by status code
```bash
gobuster dir -t 50 -d -e -u $URL -w /usr/share/seclists/Discovery/Web-Content/raft-small-words.txt -x php,txt,html,cgi,sh,bak,aspx
gobuster dir -t 50 -d -e -u $URL -w /usr/share/seclists/Discovery/Web-Content/raft-small-words-lowercase.txt -x php,txt,html,aspx,asp
gobuster dir -t 50 -d -e -u $URL -w /usr/share/seclists/Discovery/Web-Content/raft-large-files.txt
gobuster dir -e -t 50 -x php,txt,html -d -u $URL -w /usr/share/seclists/Discovery/Web-Content/raft-small-words.txt
gobuster dir -e -t 50 -x php,txt,html -d -u $URL -w /usr/share/seclists/Discovery/Web-Content/raft-small-words-lowercase.txt
gobuster dir -e -t 50 -x php,txt,html -d -u $URL -w cewl_wordlist
```

## Fast Scan (Small List)
```bash
gobuster dir -e -u $URL -w /usr/share/wordlists/dirb/big.txt -t 20
```

## Fast Scan (Big List)
```bash
gobuster dir -e -u $URL -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 20
```

## Slow Scan (Check File Extensions)

```bash
gobuster dir -e -u $URL -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,txt,html,cgi,sh,bak,aspx -t 20
```

## fix HTTPS cert errors
Set the --insecuressl flag.

## vhost enumeration
```bash
gobuster vhost -u $URL -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -t 50
gobuster vhost -u $URL -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt -t 50
gobuster vhost -u $URL -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -t 50
```

## flags
```
Flags:
  -f, --add-slash                       Append / to each request
  -c, --cookies string                  Cookies to use for the requests
  -d, --discover-backup                 Upon finding a file search for backup files
      --exclude-length ints             exclude the following content length (completely ignores the status). Supply multiple times to exclude multiple sizes.
  -e, --expanded                        Expanded mode, print full URLs
  -x, --extensions string               File extension(s) to search for
  -r, --follow-redirect                 Follow redirects
  -H, --headers stringArray             Specify HTTP headers, -H 'Header1: val1' -H 'Header2: val2'
  -h, --help                            help for dir
      --hide-length                     Hide the length of the body in the output
  -m, --method string                   Use the following HTTP method (default "GET")
  -n, --no-status                       Don't print status codes
  -k, --no-tls-validation               Skip TLS certificate verification
  -P, --password string                 Password for Basic Auth
      --proxy string                    Proxy to use for requests [http(s)://host:port]
      --random-agent                    Use a random User-Agent string
  -s, --status-codes string             Positive status codes (will be overwritten with status-codes-blacklist if set)
  -b, --status-codes-blacklist string   Negative status codes (will override status-codes if set) (default "404")
      --timeout duration                HTTP Timeout (default 10s)
  -u, --url string                      The target URL
  -a, --useragent string                Set the User-Agent string (default "gobuster/3.1.0")
  -U, --username string                 Username for Basic Auth
      --wildcard                        Force continued operation when wildcard found

Global Flags:
      --delay duration    Time each thread waits between requests (e.g. 1500ms)
      --no-error          Don't display errors
  -z, --no-progress       Don't display progress
  -o, --output string     Output file to write results to (defaults to stdout)
  -p, --pattern string    File containing replacement patterns
  -q, --quiet             Don't print the banner and other noise
  -t, --threads int       Number of concurrent threads (default 10)
  -v, --verbose           Verbose output (errors)
  -w, --wordlist string   Path to the wordlist
```
