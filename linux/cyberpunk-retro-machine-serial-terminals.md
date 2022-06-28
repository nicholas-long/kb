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

## Tandy TRS-80 Model 100 terminal
must be connected to a computer through a null modem connection.

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
need significant hacks to remove color from `ex`.
- using ed as editor
not possible to pipe lines into commands?
