# bloodhound python docker
must use FQDN for `-dc` parameter
```bash
git clone https://github.com/fox-it/BloodHound.py
cd BloodHound.py/
docker build -t bloodhound .
cd -
docker run -v ${PWD}:/bloodhound-data -it bloodhound
# run bloodhound-python command inside docker
bloodhound-python -c All -u user -p password -dc 'FQDNMachineName.domain.local' -d 'domain.local' -ns $IP
```
