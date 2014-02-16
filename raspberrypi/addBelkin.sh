#!/bin/bash/
cp /etc/network/interfaces /etc/network/interfaces.backup
echo 'auto lo \n\niface lo inet loopback \niface etho0 inet dhcp \n\nallow-hotplug wlan0 \niface wlan0 inet dhcp \n\nwpa-ssid "belkin.728" \nwpa-psk "abobora1234" \n\n#wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf \n#iface default inet dhcp' > /etc/network/interfaces
