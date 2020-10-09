#! /bin/bash

cd

# bspwm config
rm -rf .config/bspwm/bspwmrc
cp linuxSetup/configArchive/bspwm/bspwmrc .config/bspwm/

# sxhkd config
rm -rf .config/sxhkd/sxhkdrc
cp linuxSetup/configArchive/sxhkd/sxhkdrc .config/sxhkd/

# alacritty config
rm -rf .config/alacritty/alacritty.yml
cp linuxSetup/configArchive/alacritty/alacritty.yml .config/alacritty/

# vim config
rm -rf .vimrc
cp linuxSetup/configArchive/VIM/.vimrc .

