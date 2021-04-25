#!bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install git -y
sudo git clone https://github.com/aswiehe/ScriptCanvas.git
sudo git config --global user.name "sauron"
sudo git config --global user.email "sauron@mordor"

exit
