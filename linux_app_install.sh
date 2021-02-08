#!/bin/bash

#--------------------------Script color requiments--------------------------------#
#--------------------------PLEASE DO NOT REMOVE THIS------------------------------#

fail_color='\033[1;31m'             #red
success_color='\033[1;32m'          #green
primary_color='\033[1;97;4m'        #Bold white underlined
secondary_color='\033[1;37m'        #Bold white
propmt_color='\033[1;33m'           #yellow
reset_color='\033[0m'

#--------------------------Introduction-------------------------------------------#
#--------------------------PLEASE DO NOT REMOVE THIS------------------------------#

clear
echo "# Linux Applcation Installation started on "$(date) >> ./linux_app_install.sh

echo -e ${primary_color} 
echo "***** Linux App Install *****"
echo -e ${reset_color}

sleep 2

#---------------------------------------------------------------------------------#

#--------------------------SCRIPT GUARD LINES-------------------------------------#
#--------------------------PLEASE DO NOT REMOVE THIS------------------------------#


# 0. Add other useful linux applications on the 'Application Installation Section'.


# 1. Display to the user, what appliction is to be installed. 


# 1.1 Check if application already exists on the system...

    # 1.2 If so, then Display fail message of applcation already installed.
        

# if not...

    # 2. Prompt the user, if they would like to install this Application. 

    # 3.1 if they answered yes... do the following

    # 3.1.1 Prefix, echo $PASS | sudo -S apt install -yf <name of the application>

    # 3.1.2 Then display success of applcation installion.


    # 3.2 Else display fail message of applcation installion.


#---------------------------------------------------------------------------------#

#--------------------------Application Installation Section-----------------------#


# 0. Add other useful linux applications on the 'Application Installation Section'.
# Add more applictions, and after; add a space... 

WEB_BROSWERS="luakit lynx midori dillo epiphany netsurf"

UPDATE_MANAGER="update-manager-core"

TERMINAL_HELPERS="tmux neofetch mc onefetch"

EDITORS="vim nano"

DOWNLOADERS="wget axel curl"

CD_BURNS="xfburn"

AESTHETICS="cmatrix"

OTHER_APPS=""

APPLICATIONS="$WEB_BROSWERS $UPDATE_MANAGER $TERMINAL_HELPERS $EDITORS $DOWNLOADERS $CD_BURNS $AESTHETICS $OTHER_APPS"



#---------------------------------------------------------------------------------#


# Iterating over APPLICATIONS 
for app in $APPLICATIONS; do

    echo ""
    echo -e ${secondary_color} 

    # 1. Display to the user, what appliction is to be installed.     
    echo "About to Install '${app^^}'"
    
    echo -e ${reset_color}

    sleep 2

    # 1.1 checking if $app exists on your system...
    if which $app > /dev/null;
    then  
        echo ""
        echo -e ${fail_color}

        # 1.2 Display fail message of applcation already installed.
        echo "'${app^^}' applcation have already been installed!"

        echo -e ${reset_color}

    else
        echo -e ${propmt_color}

        # 2. Prompt the user, if they would like to install this Application.
        read -p "Would you like to... install '${app^^}' application [y/n]? " choice

        echo -e ${reset_color}

        # 3.1 if they annswered yes... do the following
        if [[ ${choice,,} =~ ^y(e[s|p])? ]] ;
        then

            echo "" 
            # 3.1.1 Prefix, echo $PASS | sudo -S apt install -yf <name of the application>
            echo $PASS | sudo -S apt install -yf $app

            echo ""
            echo -e ${success_color}

            # 3.1.2 Display success of applcation installion.
            echo "'${app^^}' was installed successfully..."

            echo -e ${reset_color}

        else

            echo ""
            echo -e ${fail_color}

            # 3.2 Else display fail message of applcation installion.
            echo "'${app^^}' was not installed!"

            echo -e ${reset_color}

        fi
    fi
done

#-------Other Application That Don't Require apt, or have more Scripting----------#
#-------can be placed here--------------------------------------------------------# 


#---------------------------------------------------------------------------------#

#--------------------------PLEASE DO NOT REMOVE THIS------------------------------#

echo "# Linux Application Installation ended on  "$(date) >> ./linux_app_install.sh
echo ""
echo -e ${secondary_color} 
echo "Linux Application Installation ended, Goodbye."
echo -e ${reset_color}
sleep 2
echo ""

#-------------------------Srcipt Execution Log------------------------------------#

# Linux Applcation Installation started on Mon Feb 8 21:56:26 SAST 2021
# Linux Application Installation ended on  Mon Feb 8 21:57:43 SAST 2021
