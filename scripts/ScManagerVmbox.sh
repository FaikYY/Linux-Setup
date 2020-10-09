#! /bin/bash


cd /home/syreus/linuxSetup/scripts

bash githubUserAdd.sh
bash fontJetbrainMonoInstall.sh
cd packageInstallerScripts
bash vimInstaller.sh
bash bspwmAndSxhkdInstaller.sh
bash alacrittyInstaller.sh
cd ..
bash configInstaller.sh

echo "!!!  Everything has gone well, ready to see your new linux ? Then reboot now  !!!"
sleep 4
sudo poweroff
