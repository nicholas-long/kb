# preparing malicious package payloads

## node npm package
- `npm init`
- set package name and version
- put node.js payload in `index.js`

### malicious repository ( tcp port 4873 )
- interactive login to repo `npm adduser --registry http://localhost:4873`
- publish package `npm publish --registry http://localhost:4873`
