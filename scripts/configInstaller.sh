#! /bin/bash

cd /home/syreus/

# bspwm config
rm -rf .config/bspwm/bspwmrc
cp linuxSetup/configArchive/bspwm/bspwmrc .config/bspwm/
sudo chmod +x /home/syreus/.config/bspwm/bspwmrc

# sxhkd config
rm -rf .config/sxhkd/sxhkdrc
cp linuxSetup/configArchive/sxhkd/sxhkdrc .config/sxhkd/

# alacritty config
mkdir /home/syreus/.config/alacritty
rm -rf .config/alacritty/alacritty.yml
cp linuxSetup/configArchive/alacritty/alacritty.yml .config/alacritty/

# vim config
rm -rf /home/syreus/.vimrc
cp linuxSetup/configArchive/VIM/.vimrc /home/syreus/

