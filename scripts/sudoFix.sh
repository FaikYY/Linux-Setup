#! /bin/bash

#################
##  variables  ##
#################
sleep_time=4

#NOTE: Since we do not have the root access, this script is supposed to run as root by using command "su"
echo "####  WELCOME TO SUDOERS-FILE-FIX SCRIPT, SIT BACK AND RELAX. I'M GONNA TAKE CARE OF EVERYTHING FOR YOU :)  ####"
sleep $sleep_time

if [ "$EUID" -ne 0 ]
  then echo "!!!!!!!!!   This script must be run as ROOT user. PLease try 'su -' command and run again..  !!!!!!!!!! "
  exit
fi


# go to superuser mode
#[ "${USER:-}" = "root" ] || exec sudo "$0" "$@"

# check updates
echo "**********  sudo-apt update is running..  **********"
sleep $sleep_time
apt-get update 

# if exist install
echo "**********  apt-get upgrade is running..  **********"
sleep $sleep_time
apt-get upgrade

# install needed programs
echo "**********   crucial packages are being downloaded..  **********"
sleep $sleep_time
apt-get install build-essential module-assistant

# now we're ready to rock
echo "**********   superuser is being fixed, please wait a second..  ********** "
sleep $sleep_time
apt-get install sudo -y
usermod -aG sudo syreus
chmod 0440 /etc/sudoers

echo "!!!!  COMPLETED SUCCESSFULLY, PLEASE REBOOT TO SEE THE CHANGES  !!!!"

