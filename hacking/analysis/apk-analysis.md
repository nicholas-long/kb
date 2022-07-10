# apk analysis

## decompile to bytecode and inspect objects
https://github.com/Konloch/bytecode-viewer

## emulate a phone with genymotion and virtualbox
- find android version and phone that can run apk

### configuring burpsuite on genymotion phone
- proxy through burpsuite
  - in burpsuite: set proxy settings to listen on all interfaces
  - on phone
    - old -> tap / click and hold "wifi" network; tap modify network
    - new -> gear icon
    - advanced options
      - set proxy to manual
      - enter IP and port
see "mobile apps and API testing"
