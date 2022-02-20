- web 200 has list of things to try for http
- need
  - list of things to try for each service
  - common commands
    - try printing with echo
    - try printing with less
    - use env vars for parameter positions?
- wfuzz instead of dir busting for thorough enumeration
  - use low threads in the real world "zombie busting"
  - fuzz all lists
    - separate into individual tasks and try small ones first
    - eventually do big ones and be patient
  - properly filter output
    - 403 can be important, don't exclude
    - hide dotfiles or other noise 
      - if there's noise, can hide by content length
- section for each svc enumerated like before
  - trim output and bring things to the to try list

# cool commands to add
## enumerate open ports if `ss` is not present
```
netstat -tunlp
```

# quick tools
- meyerweb encode decode url
- linuxpost from s1ren blog

# important tools
- squid proxy -> proxytunnel
- caddy - stand up valid https server?

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
  - insecure change password

- compromised CMS login
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

- privesc from user on system, first thing is `sudo -l`
