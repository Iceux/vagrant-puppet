#!/bin/bash
yum -y install ruby
cd /etc/yum.repos.d
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
cd ~
rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-1.el6.rf.x86_64.rpm
yum  -y  install VirtualBox-4.3
rpm -ivh https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.rpm
