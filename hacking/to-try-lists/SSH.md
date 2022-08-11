# SSH
- credential reuse
  - hydra with low threads
    - old key exchange -> use patator instead
  - crackmapexec
- restricted shell -> attempt to execute command on ssh login with argument
- password spraying
- default credentials
- problems connecting -> connect with `-vvv` to see issues
- last resorts
  - in absence of website and cewl list, make wordlist with keywords
    - hostname
    - names of services
    - words from nmap output?
## old SSH exploits
- CVE-2008-0166 check predictable keys https://github.com/g0tmi1k/debian-ssh
  - OpenSSL 0.9.8c-1 up to versions before 0.9.8g-9 on Debian-based operating systems
  - https://www.exploit-db.com/exploits/5632

