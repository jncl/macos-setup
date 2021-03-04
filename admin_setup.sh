#!/usr/bin/env bash

# cd /Users/Shared
# git clone https://github.com/jncl/macos-setup
# cd macos-setup
#
sudo -H pip3 install -U pip
sudo -H pip3 install -U ansible

ansible-galaxy install -r requirements.yml

caffeinate ansible-playbook admin_playbook.yml -i inventory -l localhost -K mac_admin_pw
