#!bin/bash

sudo mkdir /srv/shared_vm_folders
sudo mount -t vboxsf "All VMs" ~/srv/shared_vm_folders
sudo usermod -G vboxsf -a sauron
sudo shutdown -r now

exit
