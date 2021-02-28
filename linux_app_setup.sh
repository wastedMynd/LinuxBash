#!/bin/bash

# Clear screen 
clear

echo
echo "Updating Linux installed Apps."
echo
sudo apt-get -y update
clear

echo
echo "Upgrading Linux installed Apps."
echo
sudo apt-get -y upgrade
clear

echo
echo "installing Docker Engine."
echo transport https install
sudo apt-get install -y apt-transport-https
clear

echo ca certificates install
sudo apt-get install -y ca-certificates
clear

echo curl install
sudo apt-get install -y curl
clear

echo docker.io install
sudo apt-get install -y docker.io
clear

echo
echo "installing raspberry pi Sportify."
echo
sudo apt install -y raspotify


# Clear screen
clear

echo "Done, run linux_app_setup script!"
