# bloodhound

## run python version in docker
must use FQDN for `-dc` parameter
```bash
git clone https://github.com/fox-it/BloodHound.py
cd BloodHound.py/
docker build -t bloodhound .
cd -
docker run --rm -e "IP=$IP" -v ${PWD}:/bloodhound-data -it bloodhound

# run bloodhound-python command inside docker
bloodhound-python -c All -u user -p password -dc 'FQDNMachineName.domain.local' -d 'domain.local' -ns $IP

# use dns-tcp option if there are DNS errors
# or try adding hosts to the docker when running it
bloodhound-python -c All -u user -p password -dc 'FQDNMachineName.domain.local' -d 'domain.local' -ns $IP --dns-tcp
```

### with NTLM hashes instead of creds
```bash
bloodhound-python -c All -u user --hashes abcd123abcd123abcd123abcd123abcd:abcd123abcd123abcd123abcd123abcd -dc 'FQDNMachineName.domain.local' -d 'domain.local' -ns $IP
```

## stealthy collection method
DCOnly
not detectable as malicious, only queries DC machine.
ordinary bloodhound collection methods query all machines.
