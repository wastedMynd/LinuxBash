#!/bin/bash

echo -e "\n [Step 1 of 3] Downloading SpaceVim's 'install.sh' file & Piping it to Bash \n"
curl -sLf https://spacevim.org/install.sh | bash
echo -e "\n"

echo -e "\n [Step 2 of 3] Removing SpaceVim's 'install.sh' file \n"
rm install.sh
echo -e "\n"

echo -e "\n [Step 3 of 3] Verifying SpaceVim's Version \n"
vim --version
echo -e "\n"

echo -e "\n Done \n"
