Procedure
====================================================================================================
- scan ( full port )
- paste in to try list for every service
- scan with `--vuln`
- scan UDP ( slow, few ports as possible )
- scan services with scripts
- retry enumeration with new credentials on discovery

# Copy this block is into notes

To Try List
====================================================================================================

# EVERYTHING
- check version for vulnerabilities
- try reusing creds
- default credentials
- common credentials
- try name of service, software, computer name, usernames as passwords
- find things that are not COTS
- preliminary OSINT on data retrieved
- client side attacks
- debug mode
- control port, management port, debug port
- it should be reasonable; am i trying too hard?

END
====================================================================================================

---

Web stuff
====================================================================================================

# HTTP
- everything from the everything list (including web server version)
- robots.txt
- nikto
- busting
  - copy up busting to try list, run through it for paths, add
  - even if you identify CMS and version, find exposed files
  - view source of files found
  - fuzz files found for backups https://github.com/olemoudi/backup-fuzzer
  - db backups /usr/share/seclists/Discovery/Web-Content/Common-DB-Backups.txt
- manual inspection (view source)
- LFI or dir traversal
  - jhaddix
  - graceful security
  - logs or writable files to poison for LFI
  - check for Remote File Inclusion (rare)
  - everything from "LFI procedure"
  - list / enumerate running processes using proc pseudo files
  - check user input just like injections (could be passed as filenames or to commands)
  - ssh keys for usernames (linux and windows)
  - sensitive files list
- file upload
  - bypassing extension filtering
    - php: php4, php5, php?, phps, phtml, phar
- vhost enumeration
  - hostnames from nmap output
  - brute force vhost subdomains
- CMS -> everything from CMS list
- compromised CMS -> everything from "compromised CMS login" list
- API
  - docs/openapi.json
  - enumerate resources and endpoints to interact with them
  - enumerate parameters for endpoints - arjun
  - restful methods GET POST PUT DELETE
  - mass assignment - inject parameter on endpoints that are intended to update different fields
    - try parameter pollution
    - including extra parameters
    - type juggling
  - parameter or URL REST endpoint parameter directory traversal
  - everything from "API enumeration and bug hunting workflow"
  - everything from "OWASP top 10 api bugs"
- Login form -> everything from login form list
- fuzz all dynamic content
  - type juggling http post data
    - change content type to JSON and try different types for params
      - target things that might be compared with `==` and try changing them to `true`
    - brackets -> arrays
  - parameters
  - REST APIs -> get params and url params
  - IDs -> IDOR
  - fuzz hidden parameters, wordlist seclists/Discovery/Web-Content/burp-parameter-names.txt
  - fuzz with different HTTP methods (ex: POST might work and accept GET params)
  - fuzz headers and cookies if their values appear on page
    - fuzz special chars
    - payload tests
  - generated content like reports, emails, or logs
  - injection #injection
    - SQLi
      - no sqlmap -> wfuzz with wordlists in /usr/share/seclists/Fuzzing/SQLi/
      - dump data and try everything from "got access to database" list
    - SSTI
    - LDAP injection
    - NoSQL injection
    - XML
      - XXE xml external entity
      - XPath injection
    - XSS - dalfox
    - log4j log4shell injection - test every field, parameter, and http header with payload (especially Java stack)
  - general POST message vulnerabilities
  - JSON object prototype pollution
  - fuzz all parameters as get and post with get and post http methods
- generate cewl wordlist from site
  - use for login bruteforcing, busting directories, subdomains
- IDOR
- bypassing restrictions
  - `X-Forwarded-For` header bypass
    - bypass bad IP filter
    - bypass scripts returning 403
    - bypass rate limits
  - check if validated on client side
  - change user agent
  - open redirect can bypass URL validation
  - unicode normalization (hacktricks)
- JWT JSON web tokens
- cookie deserialization
- parameter pollution
- SSRF server side request forgery
- apache delete files -> delete .htaccess and possibly see php source
- retry dirbusting with response sizes instead of hiding 404 to find weird 404 endpoints
- what is different in HTTP vs. HTTPS?
- 403 forbidden servers / vhosts -> target http config information & find out why
- apache (old versions) - searchsploit plugins versions
- webdav
  - davtest unauth
  - davtest authenticated

## web to try list directory busting
for each path
  - feroxbuster medium dirs with extensions and `-e` extract links
  - .git/ and .git/HEAD
  - common
  - files
    - gobuster with extensions -> raft-large-words and discover backups `-d` option
    - wfuzz large filename list
  - directories
    - wfuzz large
    - wfuzz dir list big
/

## specific HTTP server exploit possibilities
- tomcat
  - tomcat + apache httpd proxy route -> path traversal with `/..;/` `www.vulnerable.com/lalala/..;/manager/html` `http://www.vulnerable.com/;param=value/manager/html` (hacktricks)
- nginx + another HTTP -> request smuggling

## CMS
- try all enumeration options for tools specific to web app
- wordpress -> wpscan initial, enumerate all plugins, bruteforce
- drupal / silverstripe -> droopescan

## found login form #loginform
- default creds
- sqli
  - sqli filtering
- SSTI
- authentication bypass
- reset password
- error message username enumeration
  - forgot password forms - applies as well
  - create user form if there is an error when user ID already exists
- register account to find authenticated endpoints
- brute forcing
- xsrf
  - add self as admin
- session attacks
  - steal session id, maybe XSS
  - clickjacking (if no X frame options set )

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
## CMS auth code exec / becoming web user
- drupal
  - "extend" "install new module"
  - install drupal project php https://www.drupal.org/project/php and enable the module
    - alternatively built in module `PHP Filter` allows editing php
  - content > add content > basic page
    - edit in source view and set text type at bottom to php code
- wordpress -> edit plugins or themes to install web shell

## github
organizations -> people and their projects / commits
check commit history for secrets / creds

## got source code
- secrets / creds
- paths and filenames
- grep vulnerable functions
- security antipatterns
- targets
  - code execution
  - file access
- deserialization vulnerabilities
- templates
- vulnerable third party libraries
- git repositories and history log
- vulnerabilities common to the programming language
  - PHP
    - common antipatterns:
      - including code based on user imput
      - SQLi
    - code execution
    - eval
    - assert
    - regular expressions that execute code
    - fuzzy equal
      - type juggling http post data (JSON, XML, url encoded)
    - laravel : SQLi with `whereRaw` for manipulating raw query
  - python
    - eval
    - pickle
    - jinja
    - web servers running in debug mode
    - TODO: finish this
  - ruby
    - mass assignment
  - javascript
    - JSON object prototype pollution
    - fuzzy equal
    - TODO: finish this
  - golang
    - user input to controllers -> `http.Request`
    - shell exec -> `exec.Command`

## old stuff for old servers
- shellshock - should find with nikto?

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

End of Web stuff
====================================================================================================

# FTP
- everything from the everything list
- anon login
- nmap script checks: bounce and anon login
- control port ( filezilla )
- bounce attack?
- Unauth enum enumerate commands with `HELP`

# SMB
- everything from the everything list
- guest access to shares
  - null auth
  - guest access with only username required
- enum4linux & enum4linux-ng
- common creds: `Guest:`
- dump users
  - impacket samrdump ( auth )
  - sid brute forcing
- rpcclient / rpcdump
  - authenticated enumeration of domains and groups
- read registry impacket reg.py
- authenticated
  - access to read `IPC$`
    - user and group enum with crackmapexec with `--rid-brute`
  - crackmapexec with `--users`
  - admin -> shell
    - psexec
    - wmiexec - quieter than psexec
- upload permissions
  - dangerous files with links to attacker smb share
- getting NTLMv2 hashes
  - if a user is viewing directories
    - scf external icon link
    - lnk
    - documents with embedded links `\\attacker`
  - user opening files
    - docx with embedded links to external images
    - docm with macros
- kerberos auth
- brute force: crackmapexec
- nmap smb vuln scan
- shell with administrator privs ( auth )
- relay?
- catch NTLM hashes from windows clients that automatically authenticate
- include AD list if machine is connected to AD
## old SMB exploits
- Samba smbd CVE-2010-0926 before 3.3.11, 3.4.x before 3.4.6, and 3.5.x before 3.5.0rc3 default config -> symlink dir traversal
- Samba smbd CVE-2017-7494 versions 3.5.0 to 4.4.14, 4.5.10, and 4.6.4 - is_known_pipename
  - these versions are 3 separate ranges, i.e. anything less than 4.5.10 is vuln ? 4.5.4 proved vulnerable
  - non metasploit version https://github.com/joxeankoret/CVE-2017-7494
- smb v1
  - ms08-067-netapi - but use DOS reverse shell instead of meterpreter

# got read or write access to filesystem
- read access
  - enum users
  - general targets
    - home dirs
    - source code
    - configuration locations
    - log files - usernames, passwords in username field, paths
  - linux targets
    - etc
      - config for other services
      - users
  - windows targets
    - registry backups
    - xampp
    - appdata
- write access
  - web shells
  - ssh authorized keys
  - scripts

# got access to databases - general SQL
- dump creds / hashes
- command execution
  - write web shell directly into outfile - may return SQL error but still write file
  - code execution built into database or with modules
  - write config backups with web shells embedded in data
- read files
- check if DBA
  - enable access to files / commands
- see what other databases are accessable

# got hashes
- md5 -> crackstation
- john
- hashcat
  - rockyou
  - rules
  - cewl wordlist
  - common seasons and years wordlist

# active directory domain
- create username list with different formats to identify usernames
- kerbrute
  - user enum
  - password spray
    - sync time before password spray! `ntpdate`
  - brute force
- crackmapexec
  - SMB
  - WinRM
  - MSSQL
  - other services exposed
- unauthenticated ASREP roast with usernames list
- retry credentials for every service
- authenticated ( probably ) lateral movement
  - impacket
    - roasting SPN service accounts
    - ASREP roast no preauth users
    - get AD users - any authenticated user
      - check notes/description of LDAP data for leaked passwords
  - bloodhound
    - run python version bloodhound.py in docker
    - paths in bloodhound
    - queries on json data
      - users - description, password last set, last login & timestamp
      - computers - OS
  - add dc hostname and machine name to hosts file if this can't authenticate
- CYCLE - reuse credentials, access services, abuse access, get more credentials
- target users who might have simple passwords ( bloodhound data, ldap? )
  - users that have not logged in `.lastlogontimestamp == -1`
  - users who had password changed and have not logged in since `.pwdlastset > .lastlogontimestamp`
- common exploits
  - headline exploits from privesc to try list
  - ticket attacks
  - cached GPP KB2928120 (see MS14-025), some Group Policy Prefs configured with account in XML
- endgame dump hashes
  - impacket secretsdump
  - mimikatz on machine or kiwi module in msf

# DNS
- look up 127.0.0.1
- look up stuff on networks
- zone transfer axfr
- brute force subdomains

# RDP
- everything from the everything list
- rdp into machine to see the login screen and get an idea of OS
- change user password

# HTTP proxy / squid proxy
- proxytunnel tool
- scan for hidden local services - low priority
- scan local network - lowest priority
  - docker network interface `172.17.0.1/241` to `172.x/8`

# SSH
- credential reuse
  - hydra with low threads
    - old key exchange -> use patator instead
  - crackmapexec
- restricted shell -> attempt to execute command on ssh login with argument
- password spraying
- last resorts
  - in absence of website and cewl list, make wordlist with keywords
    - hostname
    - names of services
    - words from nmap output?
## old SSH exploits
- CVE-2008-0166 check predictable keys https://github.com/g0tmi1k/debian-ssh
  - OpenSSL 0.9.8c-1 up to versions before 0.9.8g-9 on Debian-based operating systems
  - https://www.exploit-db.com/exploits/5632

# TFTP udp 69
- put files
  - default put location is `/var/lib/tftpboot/`
- read files

# nmap UDP scan - individual port scans
- snmp 161
- tftp 69
- rest of common

# wsmans tcp 1270, 5985, 5986
- omigod

# email
- mailsniper powershell script (OWA)
- credmaster?

# IPMI
- dump hashes and crack
- auth bypass in metasploit
- ipmitool
- zabbix -> authenticated RCE

# SNMP
- common community strings
  - public
  - private
  - brute force
- snmpwalk
- snmp-check for dumping interesting and categorized enumeration information
- onesixtyone

# LDAP
- ldapsearch
- unauthenticated enumeration
- authenticated enumeration

# finger tcp 79
- finger-user-enum https://github.com/pentestmonkey/finger-user-enum or metasploit `finger_users`

# NFS
- exfiltrate files
- home directory -> upload authorized_keys
