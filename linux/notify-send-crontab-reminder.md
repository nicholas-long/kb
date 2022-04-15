# desktop notification reminders in crontab with notify-send
```
* * * * * /bin/bash -c "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /usr/bin/notify-send -i appointment -c 'im' 'Keep Working'"
```
