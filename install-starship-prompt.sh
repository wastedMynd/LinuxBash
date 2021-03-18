#!/bin/bash

echo -e "\n [Step 1 of 5] Downloading StarShipPrompt's 'install.sh' file & Piping it to Bash \n"
curl -sLf https://starship.rs/install.sh | bash
echo -e "\n"

echo -e "\n [Step 2 of 5] Removing StarShipPrompt's 'install.sh' file \n"
rm install.sh
echo -e "\n"

echo -e "\n [Step 3 of 5] Appending the 'eval \$(starship init bash)' script line; to ~/.bashrc \n"
echo -e "\n\n# The line below; Activates the Starship Terminal  Prompt\neval \$(starship init bash)" >> ~/.bashrc
echo -e "The 'eval \$(starship init bash)' script line; was appended to ~/.bashrc; successfully..."
echo -e "\n"

echo -e "\n [Step 4 of 5] Verifying StarShipPrompt's Version \n"
starship --version || starship -v
echo -e "\n"

echo -e "\n [Step 5 of 5] Reloading the with command '. ~/.bashrc' \n"
. ~/.bashrc
echo -e "\n"

echo -e "\n Done \n"
