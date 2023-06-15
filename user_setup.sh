#!/usr/bin/env zsh

# update repo
git pull

# Install ansible for user
./install_ansible.sh

# Apply path updates (homebrew & ansible)
eval $(/usr/libexec/path_helper)

# Set Sudo timeout
echo "Defaults timestamp_timeout=90" | sudo tee /etc/sudoers.d/00-user
sleep 2
sudo visudo -cf /etc/sudoers.d/00-user

# Run playbook without sleeping
caffeinate ansible-playbook user-playbook.yaml -i inventory -l localhost $@ | tee ./user_setup.txt

# Remove sudo timeout
sudo rm /etc/sudoers.d/00-user

# remove path entries
sudo rm /etc/paths.d/30-homebrew
sudo rm /etc/paths.d/50-ansible

# Apply path updates (homebrew & ansible)
eval $(/usr/libexec/path_helper)
