# priv esc to try lists

# linux
- `sudo -l`
  - `LD_PRELOAD`
  - specific permissions to binaries / scripts
    - writable
    - [exploiting linux scripts](#exploiting linux scripts)
- SUID binaries
- su or brute force with common credentials i.e. `root:root`
- OS version `uname -a && cat /etc/*-release`
- root processes `ps -efw | grep root`
- installed packages `dpkg -l`
- find scripts, crons, timers
  - pspy
  - exploit wildcards in scripts or cron jobs
  - cron jobs
    - writable scripts
    - writable things used by script
  - [exploiting linux scripts](#exploiting linux scripts)
  - writable or exploitable timers
- enumerate all writable files and directories
- writable PATH ( not just my user's path )
- writable service
  - directories `systemctl show-environment`
- headline exploits from privesc to try list
- linux exploit suggester or `les2.pl`
- meterpreter local suggester
- search files by modification date with `find` to see what creators added
- directory permissions that let you move files you can't access
- processes with readable memory
- linpeas ( is it allowed on OSCP? )

## exploiting linux scripts
- injecting user commands
- relative command names ( alter PATH )
- filesystem access 
  - read and write sensitive files
  - surprise symlinks
- wildcards turning into command parameters
- exec
- python scripts: everything from to try list for "got source code"

# windows
- whoami /all
  - SeImpersonate -> rogue potato
  - backup permissions
- permissions
  - applications that run as SYSTEM
  - write permissions
- enum users and groups
- common general enumeration stuff
  - ports
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

# linux headline exploits
- 2022 : dirty pipe
- 2022 : pwnkit - polkit CVE

# windows headline exploits
- 2021 - present : printnightmare local privesc ( powershell available )
- ever - present : rogue potato ( SEImpersonatePrivilege )
- 2021 : hivenightmare
## windows AD headline exploits
- 2021 - nopac attack `sam the admin` on github, then psexec
- 2020 - zerologon
