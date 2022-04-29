#!/bin/bash
sudo su
sudo apt-get update -y
sudo apt install apache2 -y
sudo service apache2 start
sudo update-rc.d apache2 defaults
cd /var/www/html
echo "<html><h1>Welcome to Terraform 101</h1></html>" > index.html