#!bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install git -y
sudo -u sauron git clone https://github.com/aswiehe/ScriptCanvas.git
sudo -u sauron git config --global user.name "sauron"
sudo -u sauron git config --global user.email "sauron@mordor"

bash /home/sauron/ScriptCanvas/scripts/virtual_machine/configure_vm.sh

exit
