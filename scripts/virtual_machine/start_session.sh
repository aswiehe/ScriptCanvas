#!binbash

application_folder_name="Application"
application_name="my-first-app"
github_repo="my-first-app"

cd ~/$application_folder_name
cd $application_name

# Open github repo for the application in default browser
sensible-browser https://github.com/aswiehe/$github_repo &

# Start server  in new terminal tab and open application in default browser
gnome-terminal --tab -e 'ng serve --open'

# Open App folder in Visual Studio Code
code ~/$application_folder_name/$application_name

# Clear screen and print warning to keep other terminal tab open
clear
echo -e "\n[The other gnome-terminal tab must remain open while application is running...]\n\n"

exit

