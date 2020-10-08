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

# we need to install nodejs, npm and yarn to be able to run vim  properly
echo "**********  nodejs, npm, yarn needed to be able to run vim. Let's install them first  *********"
sleep $sleep_time

# add new repository and delete old ones
sudo add-apt-repository -y -r ppa:chris-lea/node.js
sudo rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list
sudo rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list.save
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
echo "!!!!!!!!!!  nodejs repo added to source list successfully  !!!!!!!!!!"
sleep $sleep_time

# now install nodejs and others 
VERSION=node_14.x
DISTRO="$(lsb_release -s -c)"
echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
sudo apt install nodejs npm
echo "!!!!!!!!!  Nodejs installed successfully  !!!!!!!!!"
sleep $sleep_time

# install yarn
echo "***********  time to install 'yarn'  ***********"
sleep $sleep_time
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install yarn
echo "!!!!!!!!!!  yarn installed successfully  !!!!!!!!!!"
sleep $sleep_time

# get vim from github repo
echo "**********   getting vim from github repo..  **********"
sleep $sleep_time
git clone https://github.com/vim/vim.git

# get needed packages
echo "**********   essential packages are being downloaded..  **********"
sleep $sleep_time
sudo apt install build-essential libncurses5-dev

# install process is starting here
cd vim/src
sudo ./configure
sudo make
sudo make install

