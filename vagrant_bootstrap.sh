#!/usr/bin/env bash

apt-get update
apt-get upgrade

apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
apt-get -y install sqlite3 libsqlite3-dev
apt-get install mysql-server
cd /tmp
#wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
#tar -xvzf ruby-2.1.2.tar.gz
#cd ruby-2.1.2
#./configure --prefix=/usr/local
#make
#make install
curl -sSL https://get.rvm.io | bash -s stable --ruby
source $HOME/.rvm/scripts/rvm
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
gem install bundler
cd /vagrant
bundle install
