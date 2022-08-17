# fix grub not showing windows partition
```bash
sudo echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub && sudo update-grub
```
