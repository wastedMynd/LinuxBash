#!/bin/bash
LATEST=`curl https://dl.google.com/widevine-cdm/current.txt`
pushd /usr/lib/chromium-browser
wget https://dl.google.com/widevine-cdm/$LATEST-linux-x64.zip
unzip $LATEST-linux-x64.zip
sudo mkdir /usr/lib/chromium-browser
sudo mv libwidevinecdm.so /usr/lib/chromium-browser
sudo chmod 644 /usr/lib/chromium-broswer/libwidevinecdm.so

