#!/bin/bash

success_color='\033[1;32m'          #green
primary_color='\033[1;97;4m'        #Bold white underlined
secondary_color='\033[1;37m'        #Bold white
reset_color='\033[0m'

#------------------------------------- Application Execution -------------------------------------------------------------------------------------------------#

# log to this file
echo "" >> ./upgrade_linux_kernel.sh
echo "# Last execution started at "$(date) >> ./upgrade_linux_kernel.sh

#------------------------------------ Run Application -------------------------------------------------------------------------------------------------------#

# introduction
echo -e $primary_color
echo "***** Linux Kernel Upgrade *****"
echo -e $reset_color


# folder creation
echo -e $secondary_color
echo "creating upgrade_linux_kernel folder..."
echo -e $reset_color
mkdir upgrade_linux_kernel


# folder switching
echo ""
echo -e $secondary_color
echo "swicthing to created folder..."
echo -e $reset_color
pushd upgrade_linux_kernel


# downloading
echo ""
echo -e $secondary_color
echo "Downloading linux upgrade... files!"
echo -e $reset_color
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-headers-4.8.0-040800rc6_4.8.0-040800rc6.201609121119_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-headers-4.8.0-040800rc6-generic_4.8.0-040800rc6.201609121119_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-image-4.8.0-040800rc6-generic_4.8.0-040800rc6.201609121119_amd64.deb
echo -e $seccess_color
echo ""
echo "done... Downloading!"
echo -e $reset_color


# installing downloaded files
echo ""
echo -e $secondary_color
echo "running all downloaded files..."
echo -e $reset_color
echo $PASS | sudo -S dpkg -i *.deb
echo ""
echo -e $seccess_color
echo "done... Running, Downloaded files!"
echo -e $reset_color


# log to this file again...
echo "# Last execution ended at "$(date)
echo "" >> ./upgrade_linux_kernel.sh


# inform user of system reboot
echo ""
echo -e $secondary_color
echo "about, todo a system reboot...in 30 seconds!"
echo -e $reset_color
sleep 30
echo $PASS | sudo -S reboot

#------------------------------ Logs --------------------------------------------------------------------------------------------------------------------------#

