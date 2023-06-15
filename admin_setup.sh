#!/usr/bin/env bash

# cd /Users/Shared
# git clone https://github.com/jncl/macos-setup
# cd macos-setup
#

# update repo
git pull

# Set Sudo timeout
echo "Defaults timestamp_timeout=90" | sudo tee /etc/sudoers.d/00-admin
sleep 5
sudo visudo -cf /etc/sudoers.d/00-admin

# Run playbook without sleeping
$(caffeinate -disu ansible-playbook admin-playbook.yaml -i inventory -l localhost $@ | tee ./admin_setup.txt)
r=${?}

# Remove sudo timeout
[ ${r} == 0 ] && (sudo rm /etc/sudoers.d/00-admin; sudo rm /etc/paths.d/50-ansible; eval $(/usr/libexec/path_helper))
