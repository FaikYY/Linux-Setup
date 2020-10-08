#! /bin/bash


#NOTE: Since we do not have the root access, this script is supposed to run as root by using command "su"

# go to superuser mode
#[ "${USER:-}" = "root" ] || exec sudo "$0" "$@"

# check updates
apt-get update 

# if exist install
apt-get upgrade

# install needed programs
apt-get install build-essential module-assistant

