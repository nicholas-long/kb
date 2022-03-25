# sock puppets
- online identity that is a misrepresentation. fake account, alt identity
  - looks legitimate
  - shouldn't tie back to IP
  - fake social media accounts
- generate fake name with fake name generator
- fake picture from thispersondoesnotexist.com
- virtual credit card
- use prepaid phone for 2fa
- get fake IP or VPN - match geographic location of the person

# search engine OSINT
- search name on multiple search engines
- `site:reddit.com` operator to restrict results specific sites
- quotes = specific order of words
- `AND` or `OR` for combining terms
- wildcards for partial matches of string of words
- `filetype:pdf`
- `intext:password`
- `inurl:password`
- `intitle:password`
- filter by time
- example query `site:tesla.com filetype:xlsx password`
- subdomains
  - `site:tesla.com -www -forums`
    - enumerate and remove subdomains cycle

# image OSINT
- reverse image searching (in order)
  - google
  - yandex
  - TinEye
- exif data
  - location data 
  - phone info
- pimeyes.com

# physical location OSINT
- satellite images
- flying drones

# identifying geographic locations from pictures OSINT
- look up "geoguessr tips and tricks and techniques" for example analysis 
  - vehicles
    - steering wheel
    - license
  - climate patterns
  - signage
  - architecture (especially significant buildings)
- geoguessr.com gamified location id; one free play per day

# email OSINT
- discover email addresses
- hunter.io
  - find websites containing specific email domains
  - identify email name patterns
- phonebook.cz search domains, urls, email addresses
- voilanorbert.com - search by name and domain
- clearbit connect chrome extension - search engine for people and job titles
- checking email address validity
  - emailhippo - verify email addresses in real time
  - email-checker.net/validate
- forgot password links on websites - unintended functionality
  - gmail - associate email addresses with recovery email addresses (partially censored, but strong evidence of correlation)

# password OSINT
- learn methodology instead of just specific websites because these tools might go down
- hunting breached credentials
  - iteratively associate users, passwords 
  - leaked data could be associated together like in graph database
  - take note of all credentials found in leaks to be used as potential passwords
- tools and sites
  - haveibeenpwned - check which databases
  - dehashed - paid
    - search by username, email, name, address, phone, VIN
  - weleakinfo
  - leakcheck
  - snusbase
  - scylla.sh - free, not always as thorough as paid services

# usernames and accounts OSINT
- namechk.com - what usernames are available
  - can use it to tie accounts together
- whatsmyname.app
- social media accounts uncovered may give new info like names for an username
  - user profile image -> reverse image search
  - fuzzing by typing partial names

