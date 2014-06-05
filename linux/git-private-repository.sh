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

sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
sudo apt-get update
sudo apt-get upgrade

cat mysql-config | mysql -u root -p

cd /home/git
sudo -u git -H git clone https://github.com/gitlabhq/gitlabhq.git gitlab
cd /home/git/gitlab
sudo -u git -H git checkout 6-0-stable
sudo -u git -H cp config/gitlab.yml.example config/gitlab.yml

sudo -u git -H nano config/gitlab.yml

cd /home/git/gitlab
sudo chown -R git log/
sudo chown -R git tmp/
sudo chmod -R u+rwX  log/
sudo chmod -R u+rwX  tmp/
sudo -u git -H mkdir /home/git/gitlab-satellites
sudo -u git -H mkdir tmp/pids/
sudo -u git -H mkdir tmp/sockets/
sudo chmod -R u+rwX  tmp/pids/
sudo chmod -R u+rwX  tmp/sockets/
sudo -u git -H mkdir public/uploads
sudo chmod -R u+rwX  public/uploads
sudo -u git -H cp config/unicorn.rb.example config/unicorn.rb
sudo -u git -H git config --global user.name "GitLab"
sudo -u git -H git config --global user.email "gitlab@localhost"
sudo -u git -H git config --global core.autocrlf input
sudo -u git cp config/database.yml.mysql config/database.yml

sudo -u git -H nano config/database.yml

sudo -u git -H chmod o-rwx config/database.yml

cd /home/git/gitlab
sudo gem install charlock_holmes --version '0.6.9.4'
sudo -u git -H bundle install --deployment --without development test postgres aws
