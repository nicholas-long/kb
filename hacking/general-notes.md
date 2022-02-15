- web 200 has list of things to try for http
- need
  - list of things to try for each service
  - common commands
    - try printing with echo
    - try printing with less
- wfuzz instead of dir busting for thorough enumeration
- section for each svc enumerated like before
  - trim output and bring things to the to try list



# cool commands to add
## enumerate open ports if `ss` is not present
```
netstat -tunlp
```

# important tools
- squid proxy -> proxytunnel

# things to try

- HTTP login form
  - default creds
  - sqli
    - sqli filtering
  - SSTI
  - auth bypass
  - error message username enumeration
    - forgot password forms - applies as well
  - brute forcing
  - nosql injection
  - xsrf
    - add self as admin
  - session attacks
    - steal session id, maybe xss
    - clickjacking (if no X frame options set )

- CMS login
  - service versions exploit db
  - file uploads
  - user privileges
  - code execution directly
  - modules/extensions/addons 
    - upload with malicious backdoors
  - downgrade attack
  - edit some extension or functionality
    - plant executable code
  - access to sensitive database credentials
  - assess the functionality provided to it and seeing if we can abuse it

- privesc from user on system, first thing is `sudo -l`
