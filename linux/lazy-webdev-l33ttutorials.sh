#!/bin/bash
clear
echo "Preparing to remove the openJDK"
sudo apt-get -y remove --purge openjdk-*
sudo add-apt-repository -y ppa:webdup8team/java
sudo apt-get update
sudo mkdir -p /usr/lib/mozilla/plugins
sudo apt-get -y install oracle-java8-installer

echo "OpenJDK was deleted and the Oracle Java was installed"
echo ""
echo "Installing all the remaining softwares..."
echo ""
sudo apt-get -y install git apache2 postgresql pgadmin3 mysql-server php5 libapache2-mod-php5 php5-pgsql php5-mysql

echo "Softwares were installed succesfully."
echo "Netbeans 7.4 will be downloaded"
echo ""
wget http://download.netbeans.org/netbeans/7.4/final/bundles/netbeans-7.4-linux.sh

echo "Netbeans 7.4 was downloaded. Now it will begin to install itself."
sudo chmod 777 $(pwd)"/netbeans-7.4-linux.sh"
sudo sh $(pwd)"/netbeans-7.4-linux.sh"

echo "Netbeans 7.4 was installed. Downloading and installing Sublime Text 2"

SUBLIMEVERSION='http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.tar.bz2'
SUBLIME="sublimetext.tar.bz2"
if [ $(uname -m)=='x86_64' ]
   then
      SUBLIMEVERSION='http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2'
fi

wget $SUBLIMEVERSION -O $SUBLIME
mkdir 'sublimecontents'
tar -xf $(pwd)"/$SUBLIME" --strip 1 -C $(pwd)"/sublimecontents"
sudo cp -r $(pwd)"/sublimecontents" "/opt/"
LINK='sublime'
sudo ln -s "/opt/sublimecontents/sublime_text" "/usr/bin/$LINK"


echo "Removing temporary files"
sudo rm -r $(pwd)"/sublimecontents"
sudo rm $(pwd)"/sublimetext.tar.bz2"
sudo rm $(pwd)"/netbeans-7.4-linux.sh"

echo "Removed."
echo "Everything looks fine. Go to my blog and thank me if you can."
echo "http://l33ttutorials.wordpress.com/2014/02/15/creating-a-good-development-environment"
echo "Created by: Pablo Henrique P. Silva"
echo ""