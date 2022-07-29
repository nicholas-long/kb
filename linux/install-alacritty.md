# install alacritty 
## fix build errors
Install apt packages
- cargo
- cmake
- libx11-xcb-dev
- libxcb-xfixes0-dev
- libxcb-render0-dev
- libxcb-shape0-dev
- pkg-config
- librust-servo-fontconfig-sys-dev

## commands
```bash
sudo apt install -y cargo cmake libx11-xcb-dev libxcb-xfixes0-dev libxcb-render0-dev libxcb-shape0-dev pkg-config librust-servo-fontconfig-sys-dev
cargo install alacritty
```

## config file
~/.alacritty.yml

### example yaml config
https://github.com/alacritty/alacritty
https://github.com/alacritty/alacritty/blob/master/alacritty.yml
