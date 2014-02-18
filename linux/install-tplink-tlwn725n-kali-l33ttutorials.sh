#!/bin/bash

clear
echo "Downloading the firmware. Thank you >>> lwfinger <<< !!"
echo "lwfinger's Git repository: https://github.com/lwfinger"
echo ""
wget https://github.com/lwfinger/rtl8188eu/tarball/master -O rtl8188eu.tar.gz

FOLDER='/rtltemp'
mkdir $(pwd)$FOLDER
tar xvf $(pwd)'/rtl8188eu.tar.gz' --strip 1 -C $(pwd)$FOLDER

apt-get install linux-headers-$(uname -r)

cd $(pwd)$FOLDER
make
make install
modprobe 8188eu

cd ../
rm -r $(pwd)$FOLDER
rm rtl8188eu.tar.gz
