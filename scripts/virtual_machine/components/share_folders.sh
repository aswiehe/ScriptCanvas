#!bin/bash

user=sauron

sudo -u sauron mkdir /srv/shared_vm_folders
sudo -u sauron mkdir /srv/shared_vm_folders/all_virtual_machines
read -p $'\n'"Create a shared folder in the VirtualBox GUI by adding a new folder in Machine Folders with the following settings:"$'\n\n\t'"1. Folder Path (whatever it is on the Host, check other VMs if necessary). Folder name will be all_virtual_machines"$'\n\t'"2. Enable Auto-Mount"$'\n\t'"3. Folder Name: all_virtual_machines"$'\n\t'"4. Mount-Point: /srv/shared_vm_folders/all_virtual_machines/"$'\n\t'"5: Enable Make Permanent"$'\n\n\t'"PRESS ENTER ONCE COMPLETE..."
read -p $'\t'"YOU ARE SURE YOU ARE DONE? VIRTUAL MACHINE WILL REBOOT ONCE YOU PRESS ENTER..."
sudo usermod -G vboxsf -a $user
sudo chown sauron /srv/shared_vm_folders
sudo chgrp sauron /srv/shared_vm_folders
sudo chgrp sauron /srv/shared_vm_folders/all_virtual_machines

exit
