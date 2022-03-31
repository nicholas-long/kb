# API enumeration and bug hunting workflow
tips from InsiderPhD
- target endpoints that have the most complex business logic
- tools
  - arjun for discovering parameters
  - burp suite for fuzzing and requests
  - wfuzz/ffuf for fuzzing
  - kiterunner
- workflow
  - mess around on the site with burp suite recording requests
    - "press all the buttons"
  - look for
    - endpoints returning info
    - IDs
    - signs of internal APIs
    - reflected input
  - assess API structure
    - find all endpoints for resources and what they do
    - assess impact of changing things
    - look for self documenting API endpoints to quickly find all the other endpoints
  - enumerate resources
  - enumerate parameters for endpoints
  - run wfuzz/ffuf through burp to get all the endpoints in burp automatically
- wordlists
  - seclists
    - raft words
  - fuzzdb
  - nahamsec video on wordlist creation
  - API wordlist creation
    - similar services' documented APIs
    - cewl wordlist from site
      - waybackmachine
    - append any domain specific knowledge to wordlists
# API enumeration
- self documenting APIs
  - look for swagger, usually in `/__swagger__/`

# API enumeration - good wordlists
## seclists for endpoints
/usr/share/seclists/Discovery/Web-Content/swagger.txt
/usr/share/seclists/Discovery/Web-Content/api/api-endpoints.txt
/usr/share/seclists/Fuzzing/fuzz-Bo0oM.txt
/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt
/usr/share/seclists/Discovery/DNS/dns-Jhaddix.txt
## API enumeration wordlists by size
```
      49 /usr/share/seclists/Discovery/Web-Content/swagger.txt
     268 /usr/share/seclists/Discovery/Web-Content/api/api-endpoints.txt
    4842 /usr/share/seclists/Fuzzing/fuzz-Bo0oM.txt
 1273833 /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt
 2171687 /usr/share/seclists/Discovery/DNS/dns-Jhaddix.txt
```
