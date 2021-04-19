#!bin/bash

# Simple script to create a sudo user, disable root login, and connect with a git newly created Github repo
# This script is bulky and doesn't a very defined scope. Probably should not be used (should be broken up into multiple scripts - git setup is already handled more cleanly by local_git_config.sh)

read -p "Enter new local system username: " SYSTEMUSER
read -p "Enter new local git username: " GITUSER
read -p "Enter new local git email: " GITEMAIL
read -p "Enter your Github username: " GITHUBUSER
read -p "Enter your Github repository: " GITREPO
adduser $SYSTEMUSER
usermod -aG sudo $SYSTEMUSER
cd /etc/ssh/
sed -i 's/PermitRootLogin\syes/PermitRootLogin\+no/g' sshd_config
scp setup.sh /home/$SYSTEMUSER/
sudo -u $SYSTEMUSER apt update -y
sudo -u $SYSTEMUSER apt upgrade -y

sudo -u $SYSTEMUSER apt install git -y
sudo -u $SYSTEMUSER git init
sudo -u $SYSTEMUSER git config --global user.name $GITUSER
sudo -u $SYSTEMUSER git config --global user.email $GITEMAIL
sudo -u $SYSTEMUSER git add *
sudo -u $SYSTEMUSER git commit -m "A new local repo has been created using setup.sh and has set its origin to this remote repo"
sudo -u $SYSTEMUSER git branch -M master
sudo -u $SYSTEMUSER git remote add origin https://github.com/$GITHUBUSER/$GITREPO.git
sudo -u $SYSTEMUSER git push origin master

su - $SYSTEMUSER
