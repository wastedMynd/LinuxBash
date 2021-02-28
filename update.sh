#!/bin/bash

clear
echo "" >> ~/Desktop/update.sh
echo "# update started at    "$(date) >> ~/Desktop/update.sh

echo "[ STEP 0 ] sudo dpkg --configure -a"
echo $PASS | sudo -S dpkg --configure -a
clear
echo "[ STEP 0 ] fnished! at "$(date)

echo "[ STEP 1 ] sudo apt-get install update-manager-core... envoked!"
sudo apt-get install -yf update-manager-core
clear
echo "[ STEP 1 ] finished! at "$(date)
sleep 2

echo "[ STEP 2 ] sudo apt-get update... envoked!"
sudo apt-get update
clear
echo "[ STEP 2 ] finished! at "$(date)
sleep 2

echo "[ STEP 3 ] sudo apt-get upgrade... envoked!"
sudo apt-get -y upgrade
clear
echo "[ STEP 3 ] finished! at "$(date)
sleep 2

echo "[ STEP 4 ] sudo do-release-upgrade... envoked!"
sudo do-release-upgrade 
clear
echo "[ STEP 4 ] finished! at "$(date)
sleep 2
clear

echo "# update ended   at    "$(date) >> ~/Desktop/update.sh
echo "" >> ~/Desktop/update.sh

echo "[ All Steps Completed Successfully!!!! ] at "$(date)
sleep 5
clear

# update started at    Sat Feb 6 16:52:52 SAST 2021
# update ended   at    Sat Feb 6 16:53:39 SAST 2021

# update started at    Sat Feb 6 17:02:33 SAST 2021
# update ended   at    Sat Feb 6 17:03:12 SAST 2021


# update started at    Sat Feb 6 17:09:22 SAST 2021
# update ended   at    Sat Feb 6 17:10:41 SAST 2021


# update started at    Sat Feb 6 17:11:03 SAST 2021
# update ended   at    Sat Feb 6 17:12:16 SAST 2021


# update started at    Sat Feb 6 17:27:13 SAST 2021
# update ended   at    Sat Feb 6 17:31:00 SAST 2021

# update started at    Sun Feb 7 18:07:49 SAST 2021
# update started at    Sun Feb 7 18:22:11 SAST 2021
