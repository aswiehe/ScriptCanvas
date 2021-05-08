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

# Clear screen and show git status so user sees differences between local repo and the remote one shown in browser
clear
git status

# Warn user about the other tab that is open, and that it must remain open while the application is running
echo -e "\n\n\n\n\n\n[The other gnome-terminal tab must remain open while application is running...]\n"

exit

