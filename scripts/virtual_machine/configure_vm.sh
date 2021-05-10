#!bin/bash


######################################################################

# UPDATE/UPGRADE ENVIRONMENT AND DEFINE DEFAULTS

######################################################################


# Check for update/upgrade
sudo apt update -y
sudo apt upgrade -y

# Define default paths
default_scriptpath=~/ScriptCanvas/scripts/virtual_machine/components/
default_logpath=~/ScriptCanvas/logs/

# Define default file extensions
script_extension=.sh
log_extension=.log


######################################################################

# DEFINE VM COMPONENTS TO BE CONFIGURED

######################################################################


# SSH
component_id=0
component_0_tag=ssh
component_0_name=enable_ssh
component_0_description="Sets enables SSH on the virtual machine for accessing remotely"
component_0_scriptpath=$default_scriptpath
component_0_scriptname=$component_0_name$script_extension
component_0_logpath=$default_logpath
component_0_logname=$component_0_name$log_extension

# VLC
component_id=1
component_0_tag=vlc
component_1_name=install_vlc
component_1_description="Installs VLC as a simple way (read: flimsy) to get some important codecs"
component_1_scriptpath=$default_scriptpath
component_1_scriptname=$component_1_name$script_extension
component_1_logpath=$default_logpath
component_1_logname=$component_1_name$log_extension

# VirtualBox Guest Additions
component_id=2
component_0_tag=vbga
component_2_name=enable_vm_guest_additions
component_2_description="Sets up VirtualBox Guest Additions on virtual machine"
component_2_scriptpath=$default_scriptpath
component_2_scriptname=$component_2_name$script_extension
component_2_logpath=$default_logpath
component_2_logname=$component_2_name$log_extension

# Shared Folders
component_id=3
component_0_tag=shrdf
component_3_name=share_folders
component_3_description="Interactive setup for shared folders between this VM's and others on the host"
component_3_scriptpath=$default_scriptpath
component_3_scriptname=$component_3_name$script_extension
component_3_logpath=$default_logpath
component_3_logname=$component_3_name$log_extension


######################################################################

# RUN SCRIPTS TO INSTALL AND WRITE OUTPUT TO LOG FILES

######################################################################


# Run each of the scripts and write the outputs to log files
bash $component_0_scriptpath/$component_0_scriptname > $component_0_logpath/$component_0_logname
bash $component_1_scriptpath/$component_1_scriptname > $component_1_logpath/$component_1_logname
bash $component_2_scriptpath/$component_2_scriptname > $component_2_logpath/$component_2_logname
bash $component_3_scriptpath/$component_3_scriptname > $component_3_logpath/$component_3_logname



######################################################################

# WRAP UP CONFIGURATION

######################################################################

# Shutdown and reboot for the scripts that need that to finish

exit
