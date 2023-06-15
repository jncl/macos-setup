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
caffeinate -i ansible-playbook user-playbook.yaml -i inventory -l localhost $@ | tee ./user_setup.txt
r=${?}

# Remove sudo timeout & path files
[ ${r} == 0 ] && (sudo rm /etc/sudoers.d/00-user; sudo rm /etc/paths.d/30-homebrew /etc/paths.d/50-ansible  2>/dev/null)
