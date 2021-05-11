#!bin/bash

# Get the users desired application and directory names
read -p "Name of repo on github (Press Enter if no repo to clone): " github_repo_name
read -p "Name to give application locally (Press Enter to make same as name of Github repo): " application_name
read -p "Name of folder for new application (suggested 'Application'): " application_folder_name

if [ $sgithub_repo_name == "" && $application_name == "" ]; then
    echo "\n\nApplication name cannot be blank if not cloning from a Github repository\nExiting...\n\n"
    exit
fi

# Uncomment to prompt user for git username and email
# read -p "Git user.name you'd like to use: " git_username
# read -p "Git user.email you'd like to use: " git_useremail
git_username=sauron
git_useremail=sauron@mordor

# Set up and get into folder for new app
cd ~
mkdir $application_folder_name
cd $application_folder_name

# Install npm, use npm to install Angular CLI, and use Angular CLI to create new app
sudo apt install npm -y
sudo npm install -g @angular/cli
ng new $application_name

# Go into directory of new app and set up git
cd $application_name
git config --global user.name "sauron"
git config --global user.name "sauron@mordor"


# Start app server
ng serve --open


exit
