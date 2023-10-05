#!/bin/bash

# Update the package list and upgrade existing packages
sudo apt-get update
sudo apt-get upgrade -y

# Install Apache web server
sudo apt-get install apache2 -y

# Start and enable Apache to start on boot
sudo systemctl start apache2
sudo systemctl enable apache2

# Install MySQL server and set root password when prompted
sudo apt-get install mysql-server -y

# Install PHP and required modules
sudo apt-get install php libapache2-mod-php php-mysql -y

# Restart Apache to apply PHP changes
sudo systemctl restart apache2

# Create a simple PHP info page to test the LAMP stack
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/phpinfo.php

# Secure the MySQL installation (this step will prompt you to configure security settings)
sudo mysql_secure_installation

echo "LAMP stack installation complete."