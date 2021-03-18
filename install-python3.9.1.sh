#!/bin/bash

echo -e "\n [Step 1 of 7] Downloading Python3.9.1 tgz file \n"
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
echo -e "\n"

echo -e "\n [Step 2 of 7] Extracting from tgz file \n"
tar -xf Python-3.9.1.tgz
echo -e "\n"

echo -e "\n [Step 3 of 7] Changing to Python-3.9.1 folder \n"
cd Python-3.9.1
echo -e "\n"

echo -e "\n [Step 4 of 7] Configuring for Optimization \n"
./configure --enable-optimizations
echo -e "\n"

echo -e "\n [Step 5 of 7] Building Python3.9.1 \n"
make -j 12
echo -e "\n"

echo -e "\n [Step 6 of 7] Making Alt installations \n"
sudo make altinstall
echo -e "\n"

echo -e "\n [Step 7 of 7] Verifying Python3.9.1 Version \n"
python3.9 --version
echo -e "\n"

echo -e "\n Done \n"

