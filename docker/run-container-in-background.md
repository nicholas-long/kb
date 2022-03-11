# run container in background without exiting
The foreground app running in the docker will exit if the stdin is EOF.
In most cases, if it's running sh or bash, a closed input stream means the program should exit.
To prevent this, attach a tty and detach from the running container.
```bash
docker run -td ImageName
```
