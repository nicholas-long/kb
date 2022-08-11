# active directory certificate services AD CS
https://redteam.wiki/postexploitation/active-directory/adcs
https://posts.specterops.io/certified-pre-owned-d95910965cd2

## privesc
if an attacker can specify an arbitrary SAN when requesting a certificate that enables domain authentication,
and the CA creates and signs a certificate using the attacker-supplied SAN, the attacker can become any user in the domain!
- seven privesc scenarios in paper ESC1-7
- relaying as CA ESC8

## risks
- misconfigured certificate templates
- compromised CA private key
