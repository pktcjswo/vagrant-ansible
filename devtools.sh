#!/bin/bash
cd /vagrant/devtools
ansible-galaxy install -r requirements.yml -c -i -vvvv
ansible-playbook -i inventory playbook.yml