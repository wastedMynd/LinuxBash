#!/bin/bash

success_color='\033[1;32m'          #green
primary_color='\033[1;97;4m'        #Bold white underlined
secondary_color='\033[1;37m'        #Bold white
prompt_color='\033[1;33m'           #yellow
reset_color='\033[0m'

#------------------------------------- Application Execution -------------------------------------------------------------------------------------------------#

# log to this file
echo "" >> ./upgrade_linux_kernel.sh
echo "# Last execution started at "$(date) >> ./upgrade_linux_kernel.sh

#------------------------------------ Run Application -------------------------------------------------------------------------------------------------------#

# introduction
echo -e ${primary_color}
echo "***** Linux Kernel Upgrade *****"
echo -e ${reset_color}
sleep 2

#------------------------------------------# folder creation
echo ""
echo -e ${secondary_color}
echo "creating upgrade_linux_kernel folder..."
echo -e ${reset_color}

sleep 2
mkdir upgrade_linux_kernel

#-----------------------------------------# folder switching
echo ""
echo -e ${secondary_color}
echo "swicthing to created folder..."
echo -e ${reset_color}

sleep 2
pushd upgrade_linux_kernel

#----------------------------------------# downloading
echo ""
echo -e ${secondary_color}
echo "Downloading linux upgrade... files!"
echo -e ${reset_color}

sleep 2
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-headers-4.8.0-040800rc6_4.8.0-040800rc6.201609121119_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-headers-4.8.0-040800rc6-generic_4.8.0-040800rc6.201609121119_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-image-4.8.0-040800rc6-generic_4.8.0-040800rc6.201609121119_amd64.deb

# done downloading files...
echo ""
echo -e ${seccess_color}
echo "done... Downloading!"
echo -e ${reset_color}

#--------------------------------------# installing downloaded files
echo ""
echo -e ${secondary_color}
echo "running all downloaded files..."
echo -e ${reset_color}

sleep 2
echo $PASS | sudo -S dpkg -i *.deb

# done installing downloaded files...
echo ""
echo -e ${seccess_color}
echo "done... Running, Downloaded files!"
echo -e ${reset_color}

#--------------------------------------# remove downloaded files
echo ""
echo -e ${secondary_color}
echo "Removing downloaded files... just a house cleaning, you will nolonger use this files!"
echo -e ${reset_color}

sleep 2
rm *.deb

#--------------------------------------# log to this file again..
popd
echo "# Last execution ended at "$(date) >> ./update_linux_kernel.sh
echo "" >> ./upgrade_linux_kernel.sh

#--------------------------------------# inform user of system reboot
echo ""
echo -e ${prompt_color}

sleep 2
# Prompt the user, if they would like to reboot, their system.
read -p "Would you like to do... a system reboot [y/n]? " choice

echo -e ${reset_color}

# if they annswered yes... do the following
if [[ ${choice,,} =~ ^y(e[s|p])? ]];  
then
    echo ""
    echo -e ${secondary_color}
    echo "about, todo a system reboot...in 30 seconds!"
    echo -e ${reset_color}
    sleep 30

    echo $PASS | sudo -S reboot
else	
    echo ""	
    echo -e ${prompt_color}
    echo "Just a reminder... remember to do a system reboot!"
    sleep 2
    echo -e ${reset_color}
fi

#---------------------- Reached The End of Application --------------------------------------------------------------------------------------------------------#
#------------------------------ Logs --------------------------------------------------------------------------------------------------------------------------#

