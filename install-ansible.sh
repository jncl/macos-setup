#!/usr/bin/env zsh
set -e

# setup virtual environment for ansible
python3 -m venv venv

# load virtual environment
source ./venv/bin/activate

# Install latest version of pip
python3 -m pip install --upgrade pip

# Install latest version of ansible
python3 -m pip install --upgrade ansible-core

# Install extra modules
if [[ $(pwd) == *ansible ]]
then
	# Install keyring support for ansible-vault
	python3 -m pip install --upgrade vault-keyring-client keyring
	# Install required modules for Pi setup
	python3 -m pip install --upgrade pexpect passlib
	# Setup vault password
	./venv/bin/vault-keyring-client --set --vault-id default
fi

# Install galaxy collections
ansible-galaxy install -r ./requirements.yaml
