#!/usr/bin/env zsh
set -e

# Change ownership of macos-setup directory
sudo chown -R $(id -u):$(id -g) /Users/Shared/macos-setup

# update repo
git pull

# Apply homebrew path update
eval $(/usr/libexec/path_helper)

# load ansible virtual environment
source ./venv/bin/activate

# Set Sudo timeout
echo "Defaults timestamp_timeout=90" | sudo tee /etc/sudoers.d/10-user
sleep 2
sudo visudo -cf /etc/sudoers.d/10-user

# Run playbook without sleeping
caffeinate -i ansible-playbook user-playbook.yaml -i inventory -l localhost $@ | tee ./user-setup.txt
r=${?}

# Remove sudo timeout & path files
if [ ${r} -eq 0 ]
then
	sudo rm /etc/sudoers.d/10-user
	sudo rm /etc/paths.d/30-homebrew
	sudo rm /etc/paths.d/50-ansible # 2>/dev/null
fi
