#!/usr/bin/env bash

# Install fastmirror
sudo yum -y install yum-plugin-fastestmirror

# Update packages
sudo yum -y update

# Add Ansible Repository & Install Ansible
sudo yum -y install epel-release
sudo yum -y install ansible

# Setup Ansible for Local Use and Run
cp $1 $2
chmod -x $2
cp $2 /etc/ansible/hosts -f
chmod 666 /etc/ansible/hosts
cat /vagrant/ansible/files/authorized_keys >> /home/vagrant/.ssh/authorized_keys
sudo ansible-playbook /vagrant/ansible/site.yml -i $2 --connection=local
