#!/usr/bin/env zsh
set -e

# Install Xcode cli tools if required
if [[ ! -d "/Library/Developer/CommandLineTools" ]]; then
	xcode-select --install
	# wait for CLT install to complete
	read -sk '?Waiting for CLT to complete. Press any key to continue.'
fi

# Change directory
cd ../Shared

# Clone macos-setup repo if required
if [[ ! -d ./macos-setup ]]
then
	git clone https://github.com/jncl/macos-setup
fi

# Change directory
cd macos-setup

# Apply updates
git pull

# Add homebrew path
if [[ ${$(sysctl machdep.cpu.brand_string):l} == *apple* ]]
then
	hb_path="/opt/homebrew/bin"
else
	hb_path="/usr/local/bin"
fi
echo "$hb_path" | sudo tee "/etc/paths.d/30-homebrew"

# Install ansible if required
if [[ ! -d ./venv ]]
then
	read -sk $'?Press any key to run install-ansible script.\n'
	./install-ansible.sh
fi
