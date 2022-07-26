# OSINT
https://osintframework.com/

## guides and step-by-step flowcharts
- flowcharts by "intel techniques"

## sock puppets
- online identity that is a misrepresentation. fake account, alt identity
  - looks legitimate
  - shouldn't tie back to IP
  - fake social media accounts
- generate fake name with fake name generator
- fake picture from thispersondoesnotexist.com
- virtual credit card
- use prepaid phone for 2fa
- get fake IP or VPN - match geographic location of the person

## search engine OSINT
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

## image OSINT
- reverse image searching (in order)
  - google
  - yandex
  - TinEye
- exif data
  - location data 
  - phone info
- pimeyes.com

## physical location OSINT
- satellite images
- flying drones

### identifying geographic locations from pictures OSINT
- look up "geoguessr tips and tricks and techniques" for example analysis 
  - vehicles
    - steering wheel
    - license
  - climate patterns
  - signage
  - architecture (especially significant buildings)
- geoguessr.com gamified location id; one free play per day

## email OSINT
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

## password OSINT
- learn methodology instead of just specific websites because these tools might go down
- hunting breached credentials
  - iteratively associate users, passwords 
  - leaked data could be associated together like in graph database
  - take note of all credentials found in leaks to be used as potential passwords
- tools and sites
  - haveibeenpwned - check which databases
  - dehashed - paid
    - search by username, email, name, address, phone, VIN
    - gives you credentials
  - weleakinfo
  - leakcheck
  - snusbase
  - scylla.sh - free, not always as thorough as paid services

### gives you the credentials
- dehashed

## usernames and accounts OSINT
- namechk.com - what usernames are available
  - can use it to tie accounts together
- whatsmyname.app
- social media accounts uncovered may give new info like names for an username
  - user profile image -> reverse image search
  - fuzzing by typing partial names

## people OSINT
- searching for people with websites
  - search for any piece of info and uncover other things
    - reverse address search address / phone -> person
    - middle name, age, specifics
    - relatives
    - search by IP address (also on data leaks)
  - websites
    - whitepages
    - true people search
    - fastpeoplesearch
    - fast background check
    - webmii
    - peekyou
    - thats them
    - simple googling
- public records
  - voter records
- hunting phone numbers
  - google - hit or miss
    - many sketchy website results
    - try different phone number format variations in quotes
    - try inserting a phone emoji
  - truecaller.com - contacts uploaded from various sources
  - attempt to recover yahoo account to get partial phone number (sends alert)
  - infobel.com - search in various countries
- birthdates
  - google - include full name in quotes along with `birthday` or `intext:birthday`
  - discover social media posts and congratulations
- resumes
  - linkedin
  - google name in quotes with `resume`
  - google drive links to resumes `site:google.com`

## social media OSINT
- twitter
  - search trending posts about topics, people, keyword search
    - filters
      - from
      - to
      - mentions with `@`
      - filter by date with `since` and `until`
      - `geocode:12.345,-45.678,10km`
      - advanced search with operators
  - third party websites with analytics
    - socialbearing.com
      - sentiment, domains shared, languages, followers, common words
      - associated people
    - twitonomy.com
      - active hours of the day
        - other speicific source: sleepingtime
    - mentionmapp - mentions and correlations with networks of people
    - tweetbeaver 
      - get twitter ID to track someone even if they change handle
      - conversations
    - spoonbill.io - track changes over time
    - tinfoleak - potential leak information
      - applications used
      - geo enabled
      - timezone
    - tweetdeck (tweetdeck.twitter.com logged in)
      - open live panels to watch events related to users, topics, or same search operators as twitter
- facebook
  - graph searching tools might stop working
  - search on facebook
    - include `photos of` before search to see pictures tagged in
- instagram
  - wopita
  - instadp.com
  - imginn.com - search and download images found
  - google
- snapchat
  - username search, correlate, "slow typing" competion fuzzing
  - snapchat has a map map.snapchat.com which can see snaps from specific locations 
    - use for physical location OSINT
- reddit
  - reddit searching
  - google searching - `site:reddit`
  - comment history - valuable for research
- linkedin
  - connections determine level of information you can see
  - contact info
  - some location info
  - history of posts
  - unsolicited requests to users can lead to bans
    - can use linked in recruiters to get degrees of separation to a target because they will add anyone
      - "Linked In Open Networker" LION
  - recommmendations show associated people or coworkers
- tiktok

## organizations

### github OSINT
check people associated
commit history

### job postings
- potential info on technology stack
  - check security positions for info on endpoint protection and defense

## enumerate emails and username format for domain
hunter.io
