#!/bin/bash

if [ ! -f ~/.provisionOnce ]; then

  # choose faster repository server
  #sed -i -r 's/\w+.\w+.ubuntu.com/xxxx.ubuntu.com/g' /etc/apt/sources.list
  #sed -i -r 's/\w+.ubuntu.com/xxxx.ubuntu.com/g' /etc/apt/sources.list
  
  # Oops 16.04.1
  locale-gen
  localectl set-locale LANG="en_US.UTF-8"
  apt remove -y avahi-daemon
  #vi /etc/systemd/system/network-online.target.wants/networking.service (change TimeoutStartSec)
  #vi /etc/dhcp/dhclient.conf (change timeout)

  # install ansible
  export DEBIAN_FRONTEND=noninteractive
  apt update -q
  apt install -y git
  apt install -y python-software-properties
  apt-add-repository -y ppa:ansible/ansible
  apt update -q
  apt install -y ansible
  apt autoremove -y
  unset DEBIAN_FRONTEND
  
  touch ~/.provisionOnce
fi

cd /vagrant/provisioning
ansible-galaxy install -r requirements.yml -c -i -vvv
ansible-playbook -i inventory playbook.yml