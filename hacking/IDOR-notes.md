# IDOR general steps
Find parameters that look like IDs. Change them to be different IDs to see if you can access things you shouldn't.
Try it authenticated as well. Logic bugs could lead to unchecked access in some specific endpoints, even if a lot of them are secured.
Use firefox containers to handle multiple sessions https://addons.mozilla.org/en-GB/firefox/addon/multi-account-containers/
- Prioritize
  - URLs with many parameters
  - seldom-used functionality to change things on the site
- Spreadsheet with line for every resource for access to Create, Read, Update, Delete functionality
  - for each resource
    - my user perms
      - Create
      - Read
      - Update
      - Delete
    - try to change other users resource
      - Create
      - Read
      - Update
      - Delete
- decode IDs with cyberchef
- just because you cannot edit something does not mean you couldn't create it, etc.
- bypass protections - also general tip
  - logic errors could expose different IDOR possibilities in different places
    - ex: mobile app could connect directly to API but website talks to different layers
      - API could put XSS reflected on client even though blocked on website?
