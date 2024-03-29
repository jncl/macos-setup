#!/usr/bin/env zsh

# Change ownership of macos-setup directory
sudo chown -R $(id -u):$(id -g) /Users/Shared/macos-setup

# update repo
git pull

# Install ansible for user
./install-ansible.sh

# Apply path updates (homebrew & ansible)
eval $(/usr/libexec/path_helper)

# Set Sudo timeout
echo "Defaults timestamp_timeout=90" | sudo tee /etc/sudoers.d/00-user
sleep 2
sudo visudo -cf /etc/sudoers.d/00-user

# Run playbook without sleeping
caffeinate -i ansible-playbook user-playbook.yaml -i inventory -l localhost $@ | tee ./user-setup.txt
r=${?}

# Remove sudo timeout & path files
[[ ${r} -eq 0 ]] && (sudo rm /etc/sudoers.d/00-user /etc/paths.d/30-homebrew /etc/paths.d/50-ansible 2>/dev/null)
