#!/bin/bash

#--------------------------Script color requiments--------------------------------#
#--------------------------PLEASE DO NOT REMOVE THIS------------------------------#

success_color='\033[1;32m'          #green
primary_color='\033[1;97;4m'        #Bold white underlined
secondary_color='\033[1;37m'        #Bold white
reset_color='\033[0m'

#--------------------------Introduction-------------------------------------------#
#--------------------------PLEASE DO NOT REMOVE THIS------------------------------#

started=$(date)
echo "" >> ./linux_system_update.sh
echo "# update started at    "$(date) >> ./linux_system_update.sh

clear
echo -e ${primary_color} 
echo "***** Linux System Update *****"
echo -e ${reset_color}
sleep 2
echo ""

#---------------------------------------------------------------------------------#

echo -e ${secondary_color}
echo "[ STEP 0 of 3 ] sudo dpkg --configure -a"
echo -e ${reset_color}
echo ""

echo $PASS | sudo -S dpkg --configure -a

echo ""
echo -e ${success_color}
echo "[ STEP 0 of 3 ] sudo dpkg --configure -a... fnished! at "$(date)
echo -e ${reset_color}
echo ""

#---------------------------------------------------------------------------------#

echo -e ${secondary_color}
echo "[ STEP 1 of 3 ] sudo do-release-upgrade... envoked!"
echo -e ${reset_color}
echo ""

echo $PASS | sudo -S do-release-upgrade 

echo ""
echo -e ${success_color}
echo "[ STEP 1 of 3 ] sudo do-release-upgrade... finished! at "$(date)
echo -e ${reset_color}
echo ""

#---------------------------------------------------------------------------------#

echo -e ${secondary_color}
echo "[ STEP 2 of 3 ] sudo apt-get update... envoked!"
echo -e ${reset_color}
echo ""

echo $PASS | sudo -S apt-get update

echo ""
echo -e ${success_color}
echo "[ STEP 2 of 3 ] sudo apt-get update.. finished! at "$(date)
echo -e ${reset_color}
echo ""

#---------------------------------------------------------------------------------#

echo -e ${secondary_color}
echo "[ STEP 3 of 3 ] sudo apt-get upgrade... envoked!"
echo -e ${reset_color}
echo ""

echo $PASSS | sudo -S apt-get -yf upgrade

echo ""
echo -e ${success_color}
echo "[ STEP 3 of 3 ] sudo apt-get upgrade... finished! at "$(date)
echo -e ${reset_color}
echo ""

#---------------------------------------------------------------------------------#

echo ""
echo -e ${secondary_color}
echo "[ All Steps Completed Successfully!!!! ]"
echo "started at $started , and ended at "$(date)
echo -e ${reset_color}
echo ""

#---------------------------------------------------------------------------------#

#-------------------------Srcipt Execution Log------------------------------------#
echo "# update ended   at    "$(date) >> ./linux_system_update.sh
echo "" >> ./linux_system_update.sh
#--------------------------PLEASE DO NOT REMOVE THIS------------------------------#


# update started at    Sun Feb 7 18:37:44 SAST 2021
# update ended   at    Sun Feb 7 18:39:56 SAST 2021


# update started at    Sun Feb 7 18:48:44 SAST 2021
# update ended   at    Sun Feb 7 18:50:44 SAST 2021


# update started at    Sun Feb 7 18:56:15 SAST 2021
# update ended   at    Sun Feb 7 18:58:15 SAST 2021

