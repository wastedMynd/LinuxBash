echo 'Download Google Chrome'

wget http://mirror.retrosnub.co.uk/apt/google/pool/main/g/google-chrome-stable/google-chrome-stable_48.0.2564.116-1_i386.deb

echo 'Install Chrome'

sudo dpkg -i google-chrome-stable_48.0.2564.116-1_i386.deb

sudo apt install -y google-chrome-stable_48.0.2564.116-1_i386.deb -f

rm google-chrome-stable_48.0.2564.116-1_i386.deb

sudo apt-get install -f

exit
