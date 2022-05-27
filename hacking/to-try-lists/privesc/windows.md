# windows privilege escalation
- check for local ports
- whoami /all
  - SeImpersonate -> rogue potato
  - backup permissions
- permissions
  - applications that run as SYSTEM
  - write permissions
- enum users and groups
- horizontal escalation - service users may have privileges
- common general enumeration stuff
  - enumerate installed applications and configs 
    - hunt for creds ( appdata, lazagne )
    - saved RDP and and credential manager
    - saved SSH keys on filesystem and in regsitry
    - IIS web configs
    - hacktricks "Possible filenames containing credentials"
- user data
  - clipboard
  - powershell history
  - credentials manager ( cmdkey )
- running processes
  - dump memory
- headline exploits from privesc to try list
- enum tools to run
  - winpeas
  - watson
  - powerview checks?
- writable path
- dll injection
- always install elevated
- unattended XML
- list services
  - modify executable
  - modify service
  - registry modification permissions
  - unquoted service paths
- restart perms
  - run at startup with different user
  - restart services by restarting machine
- vulnerable printer drivers
  - users can install vulnerable drivers by adding a printer type
- migrate to interactive process
- systeminfo
- check hotfixes
- wdigest ( plain text pass in registry )
- SAM & SYSTEM backups
- check perms of WSL directories
- check applocker policy
- pop up login box with powershell
- recycle bin
- WSUS - using http instead of https
- McAfee SiteList.xml
- SCCM SCClient
- domain stuff - to try list for foothold has info about domains
  - [AD to try list](./to-try-list.md#active directory domain)
- https://wadcoms.github.io/# 
- on LAN
  - responder netbios LLMNR name poisoning
  - mitm6
  - relay attacks: impacket ntlmrelayx / smbrelay
- check exploits / vulnerabilities found during enumeration
  - leaked credentials
  - potential privesc exploits
  - vulnerable services running as SYSTEM
- java web -> find website code packaged into war file
  - secrets, config, hardcoded creds

## headline exploits
- 2021 - present : printnightmare local privesc ( powershell available )
- ever - present : rogue potato ( SEImpersonatePrivilege )
- 2021 : hivenightmare

## AD headline exploits
- 2021 - nopac attack `sam the admin` on github, then psexec
- 2020 - zerologon