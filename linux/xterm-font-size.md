# set xterm font size to cope with high dpi monitors
> ~/.Xresources
```
xterm*font:     *-fixed-*-*-*-18-*
```

## refresh xterm configs
```bash
xrdb -merge ~/.Xresources
```

