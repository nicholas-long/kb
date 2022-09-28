# HTTP

## TRY
- quick wfuzz dirbust / common.txt
- robots.txt
- web enumeration quick commands
- nikto
- busting -> copy up busting to try list to new paragraph, run through paths, add
  - even if you identify CMS and version, find exposed files
  - try usernames as potential directories / files
  - don't ignore status codes
    - don't ignore 302 or you miss redirect pages with content
    - don't ignore 403 except dotfiles
- manual inspection (view source) see if content discloses anything useful
  - find forms
- found login form -> [found login form](HTTP.md#found-login-form)
  - google / seclists default creds for service
  - try service name as username / password / both
  - compromised -> [compromised CMS login](HTTP.md#compromised-cms-login)
- found CMS -> [found CMS](HTTP.md#found-cms)
  - compromised CMS -> [compromised CMS login](HTTP.md#compromised-cms-login)
- LFI or dir traversal -> [LFI or dir traversal](HTTP.md#lfi-or-dir-traversal)
  - common rabbit hole -> keep enumerating
    - file read -> keep enumerating, find interesting configs, logs, code, creds to exfil
    - LFI -> keep enumerating, find writable logs or files to execute
- file upload
  - apache -> .htaccess
- API and POST endpoints -> [API and POST endpoints](HTTP.md#api-and-post-endpoints)
  - 302 redirect page -> check for content
- fuzz dynamic content for vulnerabilities -> [vulnerability finding and fuzzing](HTTP.md#vulnerability-finding-and-fuzzing)
  - SSTI polyglot payload
  - seclists fuzzing special chars
- cookie: object / base64 / JSON / session token -> break or abruptly terminate input
- likely injection tests
  - SQLi
    - [got access to databases - general SQL](got-access-to-databases-general-SQL.md#got-access-to-databases---general-sql)
    - no sqlmap -> wfuzz with wordlists in /usr/share/seclists/Fuzzing/SQLi/
    - dump data
    - ordering column parameter and order by injection -> nested query `limit (select ...)`
  - SSTI polyglot payload
  - XML
    - XXE xml external entity
    - XPath injection
- vhost enumeration
  - hostnames from nmap output
  - brute force vhost subdomains
- got source code -> [got source code - analysis](got-source-code.md#got-source-code---analysis)
- uncommon ideas [uncommon ideas list](HTTP.md#uncommon-ideas-list)

## uncommon ideas list
- [specific HTTP server exploit possibilities](HTTP.md#specific-http-server-exploit-possibilities)
- mention github/source control -> go look it up, find source
  - organizations -> people and their projects / commits
  - check commit history for secrets / creds
- have username list -> fuzz home directories like `/~user` `/user`
- generate cewl wordlist for login bruteforcing, busting directories, subdomains
- generated file -> metadata / exiftool
- web app with secrets / 2fa -> test default secrets
- bypassing restrictions -> [bypassing restrictions](HTTP.md#bypassing-restrictions)
- upload -> bypassing extension filtering ( search "web server executable extensions" php in kb )
- unlikely injection tests
  - NoSQL injection
  - LDAP injection
  - XSS - dalfox
  - log4j log4shell injection - test every field, parameter, and http header with jndi payload (especially Java stack)
- weird HTTP response headers
- JWT JSON web tokens
  - HS variety -> crack secret with hashcat
  - got secret / key -> target cookie data for injection
- cookie deserialization
- parameter pollution
- webdav - old protocol
  - davtest unauth
  - davtest authenticated
  - target file passwd.dav
- SSRF server side request forgery
- apache delete files -> delete .htaccess and possibly see php source
- retry dirbusting with response sizes instead of hiding 404 to find weird 404 endpoints
- 403 forbidden servers / vhosts -> target http config information & find out why
- links with `target="_blank"` - tab nabbing client attack phishing redirect
- cgi-bin old servers -> shellshock
- everything list (including web server version) [EVERYTHING](EVERYTHING.md#everything)

## BUSTING directory busting to try list
fuzz files found for backups https://github.com/olemoudi/backup-fuzzer
~/kb/wordlists/custom.dirbusting
for each path
- /
  - gobuster common
  - gobuster custom.dirbusting list
  - feroxbuster with extensions ( medium dirs list ) - does some directories and files
  - files
    - gobuster with extensions -> raft-small-words and discover backups `-d` option
    - gobuster raft large files
    - wfuzz difference - look at status and content length
    - view source of files found
  - directories
    - gobuster raft medium directories
    - gobuster raft large directories
    - gobuster directory list 2.3 medium
    - wfuzz difference - look at status and content length
    - gobuster dir list big
  - db backups /usr/share/seclists/Discovery/Web-Content/Common-DB-Backups.txt
  - cewl wordlist

## specific HTTP server exploit possibilities
- apache (old versions) - searchsploit plugins versions
- cgi-bin + apache exactly 2.4.49 -> directory traversal
- tomcat
  - tomcat + apache httpd proxy route -> path traversal with `/..;/` `www.vulnerable.com/lalala/..;/manager/html` `http://www.vulnerable.com/;param=value/manager/html` (hacktricks)
- nginx + another HTTP -> request smuggling

## found CMS
- found CMS
  - try all enumeration options for tools specific to web app
    - wordpress 
      - wpscan initial
      - enumerate all plugins ( aggressive )
      - bruteforce
    - drupal / silverstripe -> droopescan
  - check plugin versions for vulns exploit-db AND google

## LFI or dir traversal
- LFI or dir traversal
  - auth / config files for this & other installed services
  - php + LFI + filters -> iconv attack RCE with python script https://book.hacktricks.xyz/pentesting-web/file-inclusion/lfi2rce-via-php-filters
  - ssh keys for usernames (linux and windows)
  - /usr/share/seclists/Discovery/Web-Content/LinuxFileList.txt
  - /usr/share/seclists/Fuzzing/LFI/LFI-gracefulsecurity-linux.txt
  - jhaddix
  - logs or writable files to poison for LFI
  - check for Remote File Inclusion (rare)
  - everything from "LFI procedure" [LFI or directory traversal procedures](../methodology/LFI-procedure.md#lfi-or-directory-traversal-procedures)
  - list / enumerate running processes using proc pseudo files
  - check user input just like injections (could be passed as filenames or to commands)
  - sensitive files list
  - open directories as files - see if directory listing supported (rare?)

## API and POST endpoints
- API and POST endpoints
  - ~/kb/wordlists/custom.dirbusting custom wordlist includes API endpoints words
  - enumerate resources and endpoints to interact with them
  - enumerate parameters for endpoints - arjun
  - restful methods GET POST PUT DELETE
  - mass assignment - inject parameter on endpoints that are intended to update different fields
    - try parameter pollution
    - including extra parameters
    - type juggling
  - parameter or URL REST endpoint parameter directory traversal
  - graphql -> [GraphQL APIs](../methodology/API-enumeration.md#graphql-apis)
  - everything from [bug hunting workflow](../methodology/API-enumeration.md#bug-hunting-workflow)
  - everything from [OWASP top 10 api bugs](../methodology/owasp-top-10-api-bugs.md#owasp-top-10-api-bugs)
  - IDOR
  - kiterunner tool and wordlists

## bypassing restrictions
- bypassing restrictions
  - `X-Forwarded-For` header bypass
    - bypass bad IP filter
    - bypass scripts returning 403
    - bypass rate limits
  - check if validated on client side
  - Host header pollution ( try localhost )
  - change user agent
  - open redirect can bypass URL validation
  - unicode normalization (hacktricks)

## found login form
- found login form
  - default creds
  - sqli
    - sqli filtering
  - SSTI
  - authentication bypass
    - wildcards
  - reset password
    - username parameter -> IDOR, account takeover
    - leak reset tokens
  - error message username enumeration
    - forgot password forms - applies as well
    - create user form if there is an error when user ID already exists
  - time based username enumeration - logic to check if user exists is very common + big hash algos
  - register account to find authenticated endpoints
  - brute forcing
  - xsrf
    - add self as admin
  - session attacks
    - steal session id, maybe XSS
    - clickjacking (if no X frame options set )

## vulnerability finding and fuzzing
- fuzz all dynamic content
  - type juggling http post data
    - change content type to JSON and try different types for params
      - target things that might be compared with `==` and try changing them to `true`
    - brackets -> arrays
  - parameters
  - REST APIs -> get params and url params
  - IDs -> IDOR
  - object / base64 / JSON / session token -> break or abruptly terminate input
  - fuzz hidden parameters, wordlist seclists/Discovery/Web-Content/burp-parameter-names.txt
  - fuzz with different HTTP methods (ex: POST might work and accept GET params)
  - fuzz headers and cookies if their values appear on page
    - fuzz special chars
    - payload tests
  - generated content like reports, emails, or logs
  - general POST message vulnerabilities
  - JSON object prototype pollution
  - fuzz all parameters as get and post with get and post http methods

## compromised CMS login
- service versions information -> exploit db
- file uploads
- user privileges - elevate
- code execution directly
- installs
- plugins/modules/extensions/addons/themes
  - upload with malicious backdoors
  - check if any installed plugins allow upload or exec
- downgrade attack - backdoor, plugin, revert to vulnerable version
- edit some extension or functionality
  - plant executable code
- diagnostic tools -> RCE?
- schedule system level jobs
- administration
  - access to sensitive database credentials
  - backups
  - database dumps
  - modify or downgrade access control lists
  - world writable directories
- assess the functionality provided to it and seeing if we can abuse it

### CMS auth code exec / becoming web user
- drupal
  - "extend" "install new module"
  - install drupal project php https://www.drupal.org/project/php and enable the module
    - alternatively built in module `PHP Filter` allows editing php
  - content > add content > basic page
    - edit in source view and set text type at bottom to php code
- wordpress -> edit plugins or themes to install web shell

## UNCOMMON HTTP ( hacktricks )
- 2fa bypass
- abusing hop by hop headers
- bypass payment process
- cache deception
- captcha bypass
- clickjacking
- client side template injection csti
- content security policy csp bypass
- cors bypass
- crlf 0d 0a
- cross site websocket hijacking cswsh
- csrf cross site request forgery
- dangling markup html scriptless injection
- domain subdomain takeover
- email header injection
- formula injection
- h2c smuggling
- http response smuggling desync
- oauth to account takeover
- open redirect
- race condition
- rate limit bypass
- regular expression denial of service redos
- reverse tab nabbing
- unicode normalization vulnerability
- xs search
- xslt server side injection extensible stylesheet languaje transformations
- xssi cross site script inclusion
