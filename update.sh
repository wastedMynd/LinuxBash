#!/bin/bash

clear
echo "" >> ~/Desktop/update.sh
echo "# update started at    "$(date) >> ~/Desktop/update.sh

echo "[ STEP 0/4 ] sudo dpkg --configure -a"
echo $PASS | sudo -S dpkg --configure -a
clear
echo "[ STEP 0/4 ] fnished! at "$(date)

echo "[ STEP 1/4 ] sudo apt-get install update-manager-core... envoked!"
sudo apt-get install -yf update-manager-core
clear
echo "[ STEP 1/4 ] finished! at "$(date)
sleep 2

echo "[ STEP 2/4 ] sudo apt-get update... envoked!"
sudo apt-get update
clear
echo "[ STEP 2/4 ] finished! at "$(date)
sleep 2

echo "[ STEP 3/4 ] sudo apt-get upgrade... envoked!"
sudo apt-get -y upgrade
clear
echo "[ STEP 3/4 ] finished! at "$(date)
sleep 2

echo "[ STEP 4/4 ] sudo do-release-upgrade... envoked!"
sudo do-release-upgrade 
clear
echo "[ STEP 4/4 ] finished! at "$(date)
sleep 2
clear

echo "# update ended   at    "$(date) >> ~/Desktop/update.sh
echo "" >> ~/Desktop/update.sh

echo "[ All Steps Completed Successfully!!!! ] at "$(date)
sleep 5
clear
