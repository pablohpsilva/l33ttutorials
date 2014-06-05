#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl git-core openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev

mkdir /tmp/ruby && cd /tmp/ruby
curl --progress ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz | tar xz
cd ruby-2.0.0-p247
./configure
make
sudo make install

sudo adduser --disabled-login --gecos 'GitLab' git
sudo gem install bundler --no-ri --no-rdoc

cd /home/git
sudo -u git -H git clone https://github.com/gitlabhq/gitlab-shell.git
cd gitlab-shell
sudo -u git -H git checkout v1.8.0
sudo -u git -H cp config.yml.example config.yml
