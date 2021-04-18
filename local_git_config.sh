#!bin/bash

sudo apt install git -y
sudo git init
sudo git config --global user.name sauron
sudo git config --global user.email sauron@mordor
sudo git remote add origin https://github.com/aswiehe/ScriptCanvas.git
sudo git pull origin master
sudo git checkout master
sudo git add *
sudo git commit -m "A new local repo has been created using setup.sh and has set its origin to this remote repo"
sudo git push origin master

exit
