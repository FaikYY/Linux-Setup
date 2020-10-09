#! /bin/bash 

#################
##  variables  ##
#################
sleep_time=4
sleep_longtime=20
homedir=/home/syreus

echo "#####  WELCOME TO ALACRITTY INSTALLER SCRIPT, SIT BACK AND RELAX. I'M GONNA TAKE CARE OF EVERYTHING FOR YOU :)  ####"
sleep $sleep_time

# install rust first
curl https://sh.rustup.rs -sSf | sh
cd 
source .cargo/env

sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
cd $homedir/Downloads
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release

# shell completion
echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc




