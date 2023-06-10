#!/usr/bin/env zsh
set -e

# Install latest version of pip
python3 -m pip install --upgrade --user pip

# Install latest version of ansible
python3 -m pip install --upgrade --user ansible-core

# Add ansible path
echo "$HOME/Library/Python/3.9/bin" | sudo tee "/etc/paths.d/50-ansible"

# Apply path updates
eval $(/usr/libexec/path_helper)
