# port forwarding

Forward port 80 to 445

```
socat TCP-LISTEN:80,fork TCP:127.0.0.1:445
```
