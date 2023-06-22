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
caffeinate -i ansible-playbook admin-playbook.yaml -i inventory -l localhost $@ | tee ./admin-setup.txt
r=${?}

# Remove sudo timeout & path files
[[ ${r} -eq 0 ]] && (sudo rm /etc/sudoers.d/00-admin /etc/paths.d/50-ansible 2>/dev/null)
