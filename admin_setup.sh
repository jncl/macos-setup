#!/usr/bin/env bash

# cd /Users/Shared
# git clone https://github.com/jncl/macos-setup
# cd macos-setup
#

# Upgrade to latest pip, required to prevent cryptography from failing to build when installing ansible
sudo -H pip3 install -U pip
# Install ansible
sudo -H pip3 install -U ansible

# Reset Sudo Password Timeout to prevent playbook from hanging
sudo -k

# Install playbook pre-requisites
ansible-galaxy install -r requirements.yml

# Run playbook without sleeping
caffeinate ansible-playbook admin_playbook.yml -i inventory -l localhost -K
