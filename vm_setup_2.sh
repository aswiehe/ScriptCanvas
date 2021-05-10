#!bin/bash

# Do everything using a single identity until requirements include mutliple users 
# The current values are placeholders until this script is to be integrated into larger development/testing systems
identity=sauron
domain=mordor
user=$identity
group=$identity

config_filename=configure_vm_2
script_extension=".sh"
log_extension=".log"
script_path=~/ScriptCanvas/scripts/virtual_machine/
log_path=~/ScriptCanvas/logs/

script_filepath=$script_path$config_filename$script_extension
log_filepath=$log_path$config_filename$log_extension


# Update, Upgrade, and Install Git
sudo apt update -y
sudo apt upgrade -y
sudo apt install git -y

# Clone the repo that has all the automation scripts and tell Git who you are
sudo -u $user git clone https://github.com/aswiehe/ScriptCanvas.git

# Change owner and group of local repo and all files within to 
sudo -u $user chown -R $user ScriptCanvas
sudo -u $user chgrp -R $group ScriptCanvas

# Navigate into local automation scripts repo and create a git identity
cd ScriptCanvas
sudo -u $user git config --global user.name "$user"
sudo -u $user git config --global user.email "$user@$domain"

# After testing for this script is complete, begin phasing in the newer commented out configure_vm_2 script
# bash /home/sauron/ScriptCanvas/scripts/virtual_machine/configure_vm_2.sh

touch $log_filepath

# Run script to set up and install components this VM will use
bash $script_filepath > $log_filepath

exit
