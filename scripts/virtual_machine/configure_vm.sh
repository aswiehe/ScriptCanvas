#!bin/bash

sudo apt update -y
sudo apt upgrade -y

bash ~/ScriptCanvas/scripts/vm_setup/components/enable_ssh.sh > /home/sauron/ScriptCanvas/logs/enable_ssh.log
bash ~/ScriptCanvas/scripts/vm_setup/components/install_vlc.sh > /home/sauron/ScriptCanvas/logs/install_vlc.log
bash ~/ScriptCanvas/scripts/vm_setup/components/enable_vm_guest_additions.sh > /home/sauron/ScriptCanvas/logs/enable_vm_guest_additions.log
bash ~/ScriptCanvas/scripts/vm_setup/components/share_folders.sh > /home/sauron/ScriptCanvas/logs/share_folders.log
sudo shutdown -r now

exit
