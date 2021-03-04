#!/usr/bin/env bash

# cd /Users/Shared
# git clone https://github.com/jncl/macos-setup
# cd macos-setup
#

export EDITOR=nano

# Set Sudo timeout for admin user
echo "Defaults timestamp_timeout=30" | sudo tee /etc/sudoers.d/admin
sudo visudo -cf /etc/sudoers.d/admin

# Upgrade to latest pip, required to prevent cryptography from failing to build when installing ansible
sudo -H pip3 install -U pip
# Install ansible
sudo -H pip3 install -U ansible

# Install playbook pre-requisites
ansible-galaxy install -r requirements.yml

# Run playbook without sleeping
caffeinate ansible-playbook admin_playbook.yml -i inventory -l localhost $@

# Remove sudo timeout for admin
sudo rm /etc/sudoers.d/admin
