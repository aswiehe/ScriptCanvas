#!bin/bash

# This file will automate the process of creating a LAMP stack on an Ubuntu 20.04 server and "connecting it" to a users (already created) Github repo

# Prompt for user-defined variables
read -p "Enter desired name of new local project folder: " PROJECTNAME
read -s -p "Enter desired MySQL root password (you will need to enter this again later): " MYSQLPSW
echo ""
read -p "Enter desired local git username: " GITUSER
read -p "Enter desired local git email: " GITEMAIL
read -p "Enter the URL of a Github repo (which you need to have already created on github) that you would like to clone (e.g. https://github.com/aswiehe/MusicReview.git): " GITURL

# Update/Upgrade
apt update -y
apt upgrade -y

# Install apache and configure firewall
apt install apache2 -y
ufw allow in "Apache Full"

# Allow traffic through port 22 for SSH and explicitly enable ufw
sudo ufw allow 22
sudo ufw enable

# Install mysq-server
apt install mysql-server -y
mysql_secure_installation
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQLPSW'";

# Install PHP
sudo apt install php libapache2-mod-php php-mysql -y

# Configure PHP to work with apache and restart apache
cat << EOF > /etc/apache2/mods-enabled/dir.conf
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
EOF
systemctl restart apache2

mkdir /var/www/$PROJECTNAME
chown -R sauron /var/www/$PROJECTNAME
chmod -R 755 /var/www/$PROJECTNAME

# Install and configure Git
apt install git
git clone $GITURL /var/www/$PROJECTNAME
git config --global user.name $GITUSER
git config --global user.email $GITEMAIL

# Create a simple file on apache server to push to your new repo
cat << EOF > /var/www/$PROJECTNAME/automated_info.php
<html>
  <head>
    <title>Git PHP Test</title>
  </head>
  <body>
    <h1>
      Test Commit File
    </h1>
    <h3>
      <?php echo "This was echo'd from PHP"; ?>
    </h3>
    <p>
      The purpose of this file is to act as a sort of "marker" that a new instance of this application has been created on a local system. This file will be removed by the same script that created it, but the commit used to push it will remain as an indicator that the local system can successfully push to the repo.
    </p>
    <br>
    <?php phpinfo(); ?>
  </body>
</html>
EOF
cd /var/www/$PROJECTNAME
git add automated_info.php
git commit -m "This commit indicates that the script (currently named lamp_setup.sh) being used to create a new project locally (probably hosted on a VPS) was successfully able to git push"
git push origin master

# Set up apache virtual host - not particularly necessary, but I bet this will come in handy later
cat << EOF > /etc/apache2/sites-available/$PROJECTNAME.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName $PROJECTNAME
    ServerAlias www.$PROJECTNAME
    DocumentRoot /var/www/$PROJECTNAME
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# Enable proper apache site and restart service
a2ensite $PROJECTNAME.conf
a2dissite 000-default.conf
apache2ctl configtest
systemctl restart apache2