#! /bin/bash

su -
cd /home/syreus/linuxSetup/scripts
bash vmboxFix.sh
bash githubUserAdd.sh
bash fontJetbrainMonoInstall.sh
cd packageInstallerScripts
bash vimInstaller.sh
bash bspwmAndSxhkdInstaller.sh
