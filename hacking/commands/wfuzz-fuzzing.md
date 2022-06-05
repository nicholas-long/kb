# wfuzz fuzzing details

## "X-Forwarded-For" header with custom IPS
## fuzz multiple parameters
- use two parameters, i.e. `-z range,1-100` `-w random-ips.lst`
- `-m zip` this will zip the parameters: attempt line 1 from both lists, then line 2 from both, etc, until exhausted
- use `FUZ2Z` for the second fuzz placeholder
  - example: `-H 'X-Forwarded-For: FUZ2Z'`

## show or hide responses containing text regex
`--ss` / `--hs` regex : Show/Hide responses with the specified regex within the content

## send to burpsuite local proxy
type could be SOCKS4,SOCKS5 or HTTP if omitted.
```
-p 127.0.0.1:8080:HTTP
```
