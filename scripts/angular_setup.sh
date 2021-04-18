#!bin/bash

read -p "Name of application: " application_name
read -p "Name of folder for new application (suggested 'Application'): " application_folder_name

cd ~
mkdir $application_folder_name
cd $application_folder_name

sudo apt install npm -y
sudo npm install -g @angular/cli
ng new $application_name
ng serve --open

exit
