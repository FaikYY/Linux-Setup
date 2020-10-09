#! /bin/bash 

#################
##  variables  ##
#################
sleep_time=4
sleep_longtime=20
homedir=/home/syreus/

echo "#####  WELCOME TO ALACRITTY INSTALLER SCRIPT, SIT BACK AND RELAX. I'M GONNA TAKE CARE OF EVERYTHING FOR YOU :)  ####"
sleep $sleep_time

if [ "$EUID" -ne 0 ]
  then echo "!!!!!  This script must be run as ROOT user. Please try 'su -' or 'sudo' command and run again..  !!!!! "
  exit
fi

# install rust first
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env
sudo apt-get install -y apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
cd $homedir/Downloads
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release



# shell completion
echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc
