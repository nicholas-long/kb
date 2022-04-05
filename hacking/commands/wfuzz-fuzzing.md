# wfuzz "X-Forwarded-For" header with custom IPS
# wfuzz fuzz multiple parameters
- use two parameters, i.e. `-z range,1-100` `-w random-ips.lst`
- `-m zip` this will zip the parameters: attempt line 1 from both lists, then line 2 from both, etc, until exhausted
- use `FUZ2Z` for the second fuzz placeholder
  - example: `-H 'X-Forwarded-For: FUZ2Z'`

