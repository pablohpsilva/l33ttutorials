!#/bin/bash
wget https://dl.dropboxusercontent.com/u/80256631/8188eu-20131223.tar.gz
tar -zxvf $(pwd)"/8188eu-20131223.tar.gz"
sudo cp $(pwd)"rtl8188eufw.bin" /lib/firmware/rtlwifi
sudo install -p -m 644 $(pwd)"8188eu.ko" "/lib/modules/"$(uname -r)"/kernel/drivers/net/wireless"
sudo insmod $(pwd)"/lib/modules/"$(uname -r)"/kernel/drivers/net/wireless"
sudo depmod -a
