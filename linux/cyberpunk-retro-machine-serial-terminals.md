# cyberpunk retro machine project

## enable usb serial port terminal as a service
ensure /dev/ttyUSB0 is connected.
```bash
sudoedit /lib/systemd/system/serial-getty@.service
# make changes
systemctl daemon-reload
systemctl enable serial-getty@ttyUSB0.service
```

### 9600 baud serial systemd service changes
9600 baud seems to fast for accurate tranfer.
lines often get cut off.
```
# Edit this line
ExecStart=-/sbin/agetty --keep-baud 115200,38400,9600 %I $TERM

# To This
ExecStart=-/sbin/agetty 9600 %I $TERM
```

### restart service if terminal disconnected
```bash
systemctl restart serial-getty@ttyUSB0.service
```

## Tandy TRS-80 Model 100 terminal
must be connected to a computer through a null modem connection.

### serial codes
- 9600 baud, usb terminal service default settings
  ` 88N1E `

### terminfo and TERM variable
```bash
git clone https://github.com/hackerb9/Tandy-Terminfo
cd Tandy-Terminfo && sudo tic tandy.terminfo
cd -

# now edit the shell rc file to change the terminal
# 8 lines
export TERM=td100
# 7 lines tall allow telnet status line
export TERM=td100-s
```

### hacks
- using ex as an editor
  - need significant hacks to remove color from `ex`.
  - need to change CRLF sent from model 100 to get it to work
- using ed as editor
  - not possible to pipe lines into commands?
- bash
  - disable colors everywhere in all bash aliases
  - bash prompt still has some weird escape characters

#### char mappings
- tandy sends 0d as enter.
- tandy expects CRLF as ordinary newline.
` stty onlcr `
- in order to actually feed the line, the tandy requires ~ 0.7s delay between CR and LF (use 1 second to be safe).
` stty cr3 nl1 `
- form feed "\f" clears the screen.
` stty ff1 `
- backspace delay?
` stty bs1 `
  - erase character with BS space BS
` stty crterase `
- strip special chars
` stty istrip `
check `man stty`, section "Output settings", it should be able to accomplish all this.
- additional considerations
  - ixon enable XON/XOFF flow control
  - ixany let any character restart output, not only start character
  - inpck enable input parity checking

### programs
https://ftp.whtech.com/club100/com/
can use dosbox to extract these self extracting archives

### copying binary programs
this is difficult and involves copying a loader written in BASIC and a data file.
the BASIC program can load the data from the doc and install the `.co` program in RAM somewhere.
