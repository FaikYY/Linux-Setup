#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

$HOME/.config/polybar/launch.sh &
bspc config top_padding 30 &


#change your keyboard if you need it
#setxkbmap -layout be


#dont know what that is
#xsetroot -cursor_name left_ptr &

#run sxhkd
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &



# nm-applet is for system tray network icon wifi management
run nm-applet &


#power management
run xfce4-power-manager &

#to enable numlock key
#numlockx on &

#bluetooth icon in system tray
blueman-applet & 

#picom for system blur and other stuff
picom --config $HOME/.config/picom/picom.conf &

#notification app
/usr/lib/xfce4/notifyd/xfce4-notifyd &

#volume control app / system tray
#run volumeicon &

#for the wallpaper
nitrogen --restore &

#screenshoot tool
#flameshot&
