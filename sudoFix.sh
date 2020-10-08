#! /bin/bash


#NOTE: Since we do not have the root access, this script is supposed to run as root by using command "su"
echo "Welcome to sudoers fixer script, sit back on relax. I'm gonna take care of everything for you :)"
sleep 2.5

if [ "$EUID" -ne 0 ]
  then echo "This script must be run as ROOT user. PLease try 'su' command and run again.. "
  exit
fi


# go to superuser mode
#[ "${USER:-}" = "root" ] || exec sudo "$0" "$@"

# check updates
echo "apt-get update is running.."
sleep 2
apt-get update 

# if exist install
echo "apt-get upgrade is running.."
sleep 2
apt-get upgrade

# install needed programs
echo "crucial packages are being downloaded.."
sleep 2.5
apt-get install build-essential module-assistant

# now we're ready to rock
echo "superuser is being fixed, please wait a second.."
sleep 2
apt-get install sudo -y
usermod -aG sudo syreus
chmod 0440 /etc/sudoers

