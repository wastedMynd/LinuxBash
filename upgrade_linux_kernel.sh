#!/bin/bash

#------------------------------------- Development Resources

success_color='\033[1;32m'          #green
primary_color='\033[1;97;4m'        #Bold white underlined
secondary_color='\033[1;37m'        #Bold white
prompt_color='\033[1;33m'           #yellow
reset_color='\033[0m'

this_script_name="upgrade_linux_kernel.sh"
housing_folder="upgrade_linux_kernel"

#------------------------------------- Application Execution -------------------------------------------------------------------------------------------------#

# log to this file
echo "" >> ./$this_script_name
echo "# Last execution started at "$(date) >> ./$this_script_name

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
pushd $housing_folder

#----------------------------------------# downloading
echo ""
echo -e ${secondary_color}
echo "Downloading linux upgrade... 'Kernel' files!"
echo -e ${reset_color}

download_file_1_url="http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-headers-4.8.0-040800rc6_4.8.0-040800rc6.201609121119_all.deb"
download_file_2_url="http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-headers-4.8.0-040800rc6-generic_4.8.0-040800rc6.201609121119_amd64.deb"
download_file_3_url="http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8-rc6/linux-image-4.8.0-040800rc6-generic_4.8.0-040800rc6.201609121119_amd64.deb"

download_files="$download_file_1_url $download_file_2_url $download_file_3_url"

# counting download_files
download_file_count=0
for file in $download_files;
do
    ((download_file_count=download_file_count + 1))
done

# let's check if 'axel' download manager is installed on the system...
if which "axel" > /dev/null;
then
    echo ""
    echo -e ${secondary_color}
    echo "Will be downloading $download_file_count 'Kernel' files; using... 'axel' download manager,"
    echo "FYI... I'll be using 8 download threads for this proccess, foreach 'Kernel' file download!"
    echo -e ${reset_color}

    download_file_counter=0
    for download_file in $download_files; do
        ((download_file_counter=download_file_counter + 1))
        echo ""
        echo -e ${secondary_color}
        echo "downloading 'Kernel' file '$download_file_counter', from: "$download_file
        echo -e ${reset_color}

        sleep 2
        echo ""
        axel -n 8 $download_file
    done
else
    echo ""
    echo -e ${secondary_color}
    echo "Will be downloading $download_file_count 'Kernel' files; using 'wget' download manager!"
    echo -e ${reset_color}

    download_file_counter=0
    for download_file in $download_files; do
        ((download_file_counter=download_file_counter + 1))
        echo ""
        echo -e ${secondary_color}
        echo "downloading 'Kernel' file '$download_file_counter', from: "$download_file
        echo -e ${reset_color}

        sleep 2
        echo ""
        wget $download_file
        
    done
fi

# done downloading files...
echo ""
echo -e ${seccess_color}
echo "done... Downloading all $download_file_count 'Kernel' files!"
echo -e ${reset_color}

#--------------------------------------# installing downloaded files
echo ""
echo -e ${secondary_color}
echo "running all $download_file_count downloaded 'Kernel' files..."
echo -e ${reset_color}

sleep 2
echo $PASS | sudo -S dpkg -i *.deb

# done installing downloaded files...
echo ""
echo -e ${seccess_color}
echo "done... Running, all $download_file_count Downloaded 'Kernel' files!"
echo -e ${reset_color}

#--------------------------------------# remove downloaded files
echo ""
echo -e ${secondary_color}
echo "Removing all $download_file_count, downloaded 'Kernel' files..."
echo "Note... I'm just doing house cleaning, since these 'Kernel' files are nolonger in use; 'will delete them'!"
echo -e ${reset_color}

sleep 2
rm *.deb
rm *.deb.*

echo ""
echo -e ${secondary_color}
echo "Removing created folder './$housing_folder'..."
echo "Note... I'm just doing, some house cleaning, since the folder is empty; 'will delete it'!"
echo -e ${reset_color}

sleep 2
popd
rmdir upgrade_linux_kernel

#--------------------------------------# log to this file again...
echo "# Last execution ended at "$(date) >> ./$this_script_name
echo "" >> ./$this_script_name

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
    echo "about, to do a system reboot...in 30 seconds!"
    echo -e ${reset_color}
    sleep 30

    echo $PASS | sudo -S reboot
else
    echo ""
    echo -e ${prompt_color}
    echo "Just a reminder... to do a system reboot!"
    sleep 2
    echo -e ${reset_color}
fi

#---------------------- Reached The End of Application --------------------------------------------------------------------------------------------------------#
#------------------------------ Logs -------------------------------------------------------------------#


# Last execution started at Thu Feb 11 00:04:10 SAST 2021
# Last execution ended at Thu Feb 11 00:08:03 SAST 2021 [UX Updated]

