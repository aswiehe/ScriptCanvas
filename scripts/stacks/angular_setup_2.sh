#!bin/bash



# Get the users desired application and folder names

github_repo_path="https://github.com/aswiehe/"

github_repo_name=""
application_name=""
folder_name=""

names_are_valid=false
folder_created_successfully=false
application_cloned_successfully=false
application_and_folder_created_successfully=false


while [[ $names_are_valid == false || $application_and_folder_created_successfully == false ]]
do

    names_are_valid=true
    folder_created_successfully=true

    echo
    read -p "Name of repo on github (Press Enter not cloning from repo): " github_repo_name
    read -p "Name of application (Press Enter to set name as Github repo): " application_name
    read -p "Name of folder for new application (Press Enter for 'Application'): " folder_name
    echo
    

    # Check for if user didn't provide a github repo or a name to save the application as locally
    if [[ $github_repo_name == "" && $application_name == "" ]] 
        then
            echo -e "Application name cannot be blank if not cloning from a Github repository"
            names_are_valid=false
    fi

    # Check for if the user provided a blank name for the folder
    if [[ $folder_name == "" ]] 
        then
        folder_name="Application"
    fi

    # Check if folder name already exists before trying to create it
    if [[ -a $HOME/$folder_name ]] 
        then
        echo -e "\nUnable to create a folder with this name (filename already exists)"
        names_are_valid=false
        folder_created_successfully=false
    else
        if mkdir "$HOME/$folder_name"
            then
            cd "$HOME/$folder_name" || exit
            echo -e "Folder created successfully\n"
            folder_created_successfully=true
        else
            names_are_valid=false
            folder_created_successfully=false
        fi
    fi

    # Start attempting to create or cloning
    if [[ $names_are_valid == true ]] 
        then
        # Create a new application without cloning a repository
        echo -e "\nNames are valid"
        if [[ $github_repo_name == "" ]]
            then
            echo -e "\nAttempting to create application"
            if mkdir "$application_name"
                then
                echo -e "\nThe application was successfully created"
                application_created_successfully=true
                application_and_folder_created_successfully=true
                
            else
                echo -e "\nThe application failed to be created"
                application_created_successfully=false
                application_and_folder_created_successfully=false
            fi
        # Clone repository with same name
        elif [[ $application_name == "" ]]
            then
            echo -e "\nAttempting to clone repository"
            if git clone "$github_repo_path$github_repo_name"
                then
                if [[ -d "$HOME/$application_name/$gihub_repo_name" ]]
                    then
                    echo -e "\nApplication cloned successfully"
                    application_cloned_successfully=true
                    application_and_folder_created_successfully=true
                else
                    echo -e "\nThe application failed to be cloned"
                    application_cloned_successfully=false
                    application_and_folder_created_successfully=false
                fi
            else
                echo -e "\nThe application failed to be cloned"
                application_cloned_successfully=false
                application_and_folder_created_successfully=false
                exit
            fi
        # Clone repository with new name
        else
            echo -e "\nAttempting to clone repository with a new name"   
            if git clone "$github_repo_path$github_repo_name" "$application_name"
                then
                if [[ -d "$gihub_repo_name" ]]
                    then
                    echo -e "\nThe application was cloned successfully (with a new name)"
                    application_cloned_successfully=true
                    application_and_folder_created_successfully=true
                else
                    echo -e "\nThe application failed to be cloned (with a new name)"
                    application_cloned_successfully=false
                    application_and_folder_created_successfully=false
                fi
                echo -e "\nThe application was cloned successfully (with a new name)"
                application_cloned_successfully=true
                application_and_folder_created_successfully=true
            else
                echo -e "\nThe application failed to be cloned (with a new name)"
                application_cloned_successfully=false
                application_and_folder_created_successfully=false
            fi
        fi
    fi

    # Tell user if everything worked alright
    echo -e "\nApplication and folder were created successfully: $application_and_folder_created_successfully"

    # Reset flag values if there was a problem, and remove the folder if it was created
    if [[ $application_and_folder_created_successfully == false ]]
        then
        names_are_valid=false
        if [[ $folder_created_successfully == true ]]
            then
            echo -e "\nRemoving folder if previously created without an application..."
            rm -rf ~/$folder_name
        fi
        folder_created_successfully=false
        echo -e "\nPlease try again...\n"
    fi

done

exit

# Uncomment to prompt user for git username and email
# read -p "Git user.name you'd like to use: " git_username
# read -p "Git user.email you'd like to use: " git_useremail
git_username=sauron
git_useremail=sauron@mordor

# Set up and get into folder for new app
cd "$HOME" || echo -e "Could not open a critical directory" & exit
mkdir "$folder_name"
cd "$folder_name" || echo -e "Could not open a critical directory" & exit

# Install npm, use npm to install Angular CLI, and use Angular CLI to create new app
sudo apt install npm -y
sudo npm install -g @angular/cli
ng new "$application_name"

# Go into directory of new app and set up git
cd "$application_name" || echo -e "Could not open a critical directory" & exit
git config --global user.name "$git_username"
git config --global user.name "$git_useremail"


# Start app server
ng serve --open


exit
