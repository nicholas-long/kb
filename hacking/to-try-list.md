Procedure
====================================================================================================
- scan ( full port )
- paste in to try list for every service
- scan with `--vuln`
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
- find things that are not COTS
- client side attacks
- debug mode
- control port, management port, debug port

END
====================================================================================================

---

Web stuff
====================================================================================================

# HTTP
- everything from the everything list
- busting
  - directories
  - files
  - common, small, medium, large, dir list big
  - wfuzz step to check for outliers
  - view source of files found
- LFI
- file upload
- nikto
- vhost enumeration
  - hostnames from nmap output
  - brute force vhost subdomains
- injection #injection
  - command injection
  - SQLi
  - SSTI
- POST message vulnerabilities
  - same as above #injection
  - XXE xee xml external entity
  - LDAP injection
  - NoSQL injection
  - general POST message vulnerabilities
    - brackets -> arrays
  - JSON object prototype pollution
- IDOR
- bypassing restrictions
  - `X-Forwarded-For` header - bypass bad IP filter
  - check if validated on client side
- JWT JSON web tokens
- cookie deserialization
- parameter pollution
- XPath injection
- SSRF server side request forgery
- XSS

## found login form #loginform
- default creds
- sqli
  - sqli filtering
- SSTI
- authentication bypass
- reset password
- error message username enumeration
  - forgot password forms - applies as well
- brute forcing
- xsrf
  - add self as admin
- session attacks
  - steal session id, maybe XSS
  - clickjacking (if no X frame options set )

## compromised CMS login
- service versions information -> exploit db
- file uploads
- user privileges
- code execution directly
- modules/extensions/addons 
  - upload with malicious backdoors
- downgrade attack - backdoor, plugin, revert to vulnerable version
- edit some extension or functionality
  - plant executable code
- diagnostic tools -> RCE?
- schedule system level jobs
- administration
  - access to sensitive database credentials
  - backups
  - modify or downgrade access control lists
  - world writable directories
- assess the functionality provided to it and seeing if we can abuse it

## got source code
- secrets / creds
- grep vulnerable functions
- security antipatterns
- targets
  - code execution
  - file access
- deserialization vulnerabilities
- templates
- vulnerable third party libraries
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
  - python
    - eval
    - pickle
    - jinja
    - web servers running in debug mode
    - TODO: finish this
  - javascript
    - JSON object prototype pollution
    - fuzzy equal
    - TODO: finish this

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
- enum4linux
- common creds: `Guest:`
- dump users
  - impacket samrdump ( auth )
  - sid brute forcing
- rpcclient / rpcdump
  - authenticated enumeration of domains and groups
- read registry impacket reg.py
- kerberos auth
- brute force: crackmapexec
- shell with administrator privs ( auth )
- relay?
- catch NTLM hashes from windows clients that automatically authenticate

# got access to filesystem
- read access
  - enum users
  - general targets
    - home dirs
    - source code
    - configuration locations
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
  - write web shell directly into outfile
  - code execution built into database or with modules
  - write config backups with web shells embedded in data
- read files
- check if DBA
  - enable access to files / commands

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
  - crackmapexec
- really old check for bad keys circa 2007

