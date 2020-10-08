#! /bin/bash


#NOTE: Since we do not have the root access, this script is supposed to run as root by using command "su"
echo "Welcome to sudoers fixer script, sit back on relax. I'm gonna take care of everything for you :)"
sleep .5


# go to superuser mode
#[ "${USER:-}" = "root" ] || exec sudo "$0" "$@"

# check updates
echo "apt-get update is running.."
sleep 1
apt-get update 

# if exist install
echo "apt-get upgrade is running.."
sleep 1
apt-get upgrade

# install needed programs
echo "crucial packages are being download.."
sleep 1
apt-get install build-essential module-assistant

# now we're ready to rock
echo "superuser is being fixed, please wait a second.."
sleep 1
apt-get install sudo -y
usermod -aG sudo syreus
chmod 0440 /etc/sudoers
