# mobile apps and API testing
- emulator + burpsuite to capture web traffic
- `frida` to hook into apps and monitor what they do
- physical device - possible
  - need root to bypass SSL pinning
## steps for mobile app API + burpsuite
- genymotion to manage emulators
- create new emulator
- install GApps - google apps and play store
- install target
- send traffic through burpsuite
- install burp certificate
- see what API calls the app is making
