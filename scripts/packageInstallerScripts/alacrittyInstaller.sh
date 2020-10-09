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
sudo curl https://sh.rustup.rs -sSf | sh

apt-get install -y cmake libfreetype6-dev libfontconfig1-dev xclip
cd $homedir/Downloads
git clone https://github.com/jwilm/alacritty.git
cd alacritty
cargo build --release

sudo cp -r alacritty /usr/local/bin
cp extra/linux/Alacritty.desktop  $homedir/.local/share/applications
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
cp extra/completions/alacritty.bash  ~/.alacritty
echo "source ~/.alacritty" >> ~/.bashrc
