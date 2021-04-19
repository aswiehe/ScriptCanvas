#!bin/bash

sudo mkdir /srv/shared_vm_folders
read -p "Create a shared folder in the VirtualBox GUI by adding a new folder in Machine Folders with the following settings:"$'\n\t'"In Machine Folders, add folder..."$'\n\t'"1. Folder Path (whatever it is on the Host, check other VMs if necessary). Folder name will be all_virtual_machines"$'\n\t'"2. Enable Auto-Mount"$'\n\t'"3. Folder Name: all_virtual_machines"$'\n\t'"4. Mount-Point: /srv/shared_vm_folders/"$'\n\t'"5:Enable Make Permanent"$'\n\n\t'"PRESS ENTER ONCE COMPLETE..."
read -p "YOU ARE SURE YOU ARE DONE? (PRESS ENTER)"
sudo usermod -G vboxsf -a sauron
sudo shutdown -r now

exit
