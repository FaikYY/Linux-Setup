#! /bin/bash

#################
##  variables  ##
#################
sleep_time=4

#NOTE: Since we do not have the root access, this script is supposed to run as root by using command "su"
echo "####  WELCOME TO BSPWM AND SXHKD INSTALLER SCRIPT, SIT BACK AND RELAX. I'M GONNA TAKE CARE OF EVERYTHING FOR YOU :)  ####"
sleep $sleep_time

if [ "$EUID" -ne 0 ]
  then echo "!!!!!!!!!   This script must be run as ROOT user. PLease try 'su -' command and run again..  !!!!!!!!!! "
  exit
fi

# install dependencies
echo "***********  dependencies are installing  **************"
sleep $sleep_time
sudo apt-get install -y libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev

# go ahead and install 
echo "***********  bspwm and sxhkd github repos installing  ***********"
sleep $sleep_time
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install

echo "********** building from source and placing configs  *********** "
sleep $sleep_time
mkdir -p /home/syreus/.config/bspwm && mkdir -p /home/syreus/.config/sxhkd
cp /home/syreus/linuxSetup/configArchive/bspwm/bspwmrc /home/syreus/.config/bspwm
cp /home/syreus/linuxSetup/configArchive/sxhkd/sxhkdrc /home/syreus/.config/sxhkd
chmod u+x /home/syreus/.config/

echo "!!!!!!!!!!  script completed successfully, you can reboot now  !!!!!!!!!!!"
