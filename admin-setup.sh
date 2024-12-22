#!/usr/bin/env zsh
set -e

# update repo
git pull

# Apply homebrew path update
eval $(/usr/libexec/path_helper)

# load ansible virtual environment
source ./venv/bin/activate

# Set Sudo timeout
echo "Defaults timestamp_timeout=90" | sudo tee /etc/sudoers.d/00-admin
sleep 5
sudo visudo -cf /etc/sudoers.d/00-admin

# Run playbook without sleeping
caffeinate -i ansible-playbook admin-playbook.yaml -i inventory -l localhost $@ | tee ./admin-setup.txt
r=${?}

# Remove sudo timeout & path files
if [ ${r} == 0 ]
then
	rm /etc/sudoers.d/00-admin
fi
