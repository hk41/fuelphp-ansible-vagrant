#!/usr/bin/env bash

# Install fastmirror
sudo yum -y install yum-plugin-fastestmirror

# Update packages
sudo yum -y update

# Add Ansible Repository & Install Ansible
sudo wget http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh epel-release-6-8.noarch.rpm
sudo yum -y install --enablerepo=ansible
sudo yum -y install ansible

# Setup Ansible for Local Use and Run
cp $1 $2
chmod -x $2
cp $2 /etc/ansible/hosts -f
chmod 666 /etc/ansible/hosts
cat /vagrant/ansible/files/authorized_keys >> /home/vagrant/.ssh/authorized_keys
sudo ansible-playbook /vagrant/ansible/site.yml -i $2 --connection=local
