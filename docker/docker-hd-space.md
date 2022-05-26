# docker cleanup

## Try to keep logs under control
/etc/docker/daemon.json
```json
{
	  "log-driver": "local",
	  "log-opts": {
		  "max-size": "5m"
	  }
}
```

## Free up space immediately
```bash
docker system prune -a -f
```

