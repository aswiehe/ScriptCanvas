#!bin/bash

sudo apt update -y
sudo apt upgrade -y

bash ~/ScriptCanvas/scripts/vm_setup/components/enable_ssh.sh
bash ~/ScriptCanvas/scripts/vm_setup/components/install_vlc.sh
bash ~/ScriptCanvas/scripts/vm_setup/components/enable_vm_guest_additions.sh
bash ~/ScriptCanvas/scripts/vm_setup/components/share_folders.sh
sudo shutdown -r now

exit
