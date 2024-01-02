#!/usr/bin/env sh

# install packages
sudo xbps-install -Su
sudo xbps-install -y $(cat .package_list)

# custom plugins for i3blocks and nnn
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

#TODO add lightdm-litarvan stuff here once i figure it out  
