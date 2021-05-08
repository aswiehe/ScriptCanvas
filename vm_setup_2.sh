#!bin/bash

# Update, Upgrade, and Install Git
sudo apt update -y
sudo apt upgrade -y
sudo apt install git -y

# Clone the repo that has all the automation scripts and tell Git who you are
sudo -u sauron git clone https://github.com/aswiehe/ScriptCanvas.git
cd ScriptCanvas
sudo -u sauron git config --global user.name "sauron"
sudo -u sauron git config --global user.email "sauron@mordor"

# After testing for this script is complete, begin testing the newer commented out configure_vm_2 script
# bash /home/sauron/ScriptCanvas/scripts/virtual_machine/configure_vm_2.sh
# Run script to set up and install components this VM will use
bash /home/sauron/ScriptCanvas/scripts/virtual_machine/configure_vm.sh

exit
