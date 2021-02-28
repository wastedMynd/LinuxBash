#!/bin/bash/

echo 'Browser(s) about to install on your system!!!'
echo

echo 'Please select a browser to install from options: to opt out press ctrl+c '
echo '1. dillo' '2. epiphany' '3. kweb' '4. Luakit' '5. lynx' '6. midori' '7. netsurf' '8. vivaldi'

read 'reading selected option'

if $1 == '1'; then
 echo 'installing dillo'
 sudo apt install -y dillo -f
 echo
else if $1 == '2'; then
 echo 'installing epiphany'
 sudo apt install -y epiphany -f
 echo
else if $1 == '3'; then 
 echo 'installing kweb'
 sudo wget http://steinerdatenbank.de/software/kweb-1.7.9.8.tar.gz
 tar -xzf kweb-1.7.9.8.tar.gz
 rm kweb-1.7.9.8.tar.gz
 pushd kweb-1.7.9.8
 ./debinstall 
 popd
 echo
else if $1 == '4'; then
 echo 'installing Luakit'
 sudo apt install -y Luakit -f
 echo
else if $1 == '5'; then
 echo 'installing lynx'
 sudo apt install -y lynx -f
 echo
else if $1 == '6'; then
 echo 'installing midori'
 sudo apt install -y midori -f
 echo
else if $1 == '7'; then
 echo 'installing netsurf'
 sudo apt install -y netsurf -f
 echo
else if $1 == '8'; then
 echo 'installing vivaldi'
 sudo wget https://downloads.vivaldi.com/stable/vivaldi-stable_3.1.1929.34-1_armhf.deb
 sudo dpkg -i vivaldi-stable_3.1.1929.34-1_armhf.deb
 rm vivaldi-stable_3.1.1929.34-1_armhf.deb
 sudo apt-get install -f
 echo
fi
