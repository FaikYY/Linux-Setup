#! /bin/bash

#################
##  variables  ##
#################
sleep_time=4


echo "#####  WELCOME TO VMBOX FIX SCRIPT, SIT BACK AND RELAX. I'M GONNA TAKE CARE OF EVERYTHING FOR YOU :)  ####"
sleep $sleep_time

if [ "$EUID" -ne 0 ]
  then echo "!!!!!  This script must be run as ROOT user. Please try 'su -' or 'sudo' command and run again..  !!!!! "
  exit
fi

echo "*********  let's install the font  **********"
sleep $sleep_time

# get the file and unzip it
cd /home/syreus/Downloads
wget https://download.jetbrains.com/fonts/JetBrainsMono-1.0.0.zip
unzip JetBrainsMono-1.0.0.zip

# move it to the system file
sudo mv JetBrainsMono-*.ttf /usr/share/fonts/
echo "!!!!!!!!!!  installation completed successfully  !!!!!!!!!!"
