#! /bin/bash 

#################
##  variables  ##
#################
sleep_time=4
sleep_longtime=20


echo "#####  WELCOME TO VMBOX FIX SCRIPT, SIT BACK AND RELAX. I'M GONNA TAKE CARE OF EVERYTHING FOR YOU :)  ####"
sleep $sleep_time

if [ "$EUID" -ne 0 ]
  then echo "!!!!!  This script must be run as ROOT user. Please try 'su -' or 'sudo' command and run again..  !!!!! "
  exit
fi

# check updates
echo "**********  sudo apt-update is running..  ********** "
sleep $sleep_time
apt-get update

# if exist install them
echo "*********  sudo apt-upgrade is running..   ********** "
sleep $sleep_time
apt-get upgrade

# install needed programs
echo "**********   crucial packages are being downloaded..   *********"
sleep $sleep_time
apt-get install -y build-essential module-assistant

# now we're ready to rock
echo "**********   vmBox is being fixed, please wait a second..   *********"
sleep $sleep_time
m-a -y prepare

# user turn
echo "please insert the vmbox additions file in 20 seconds, click devices and select install guest additions"
sleep $sleep_longtime
mount /media/cdrom
sh /media/cdrom/VBoxLinuxAdditions.run

echo "!!!!!!!   The process completed successfully, please reboot to see the changes  !!!!!"


