# macos-setup

## Install
The easiest way to install is to follow the following steps:

- Login admin
	- Make sure you have signed into the Mac App Store.  This makes mas easier to deal with
	- Install Apples's command line tools
	- Upgrade Pip to 20.3 or later
	- Install Ansible after upgrading pip to fix cryptography issue
	- Change directory
	- Clone the Repository
	- Change into the repo directory
	- Install the requirements
	- Run the Admin playbook
	- Logoff admin

- Login as User
	- Change directory to ansible scripts
	- Run the User playbook

Commands:

     Login as Administrator
	 xcode-select --install
	 ./admin_setup.sh

	 Login as User
	 cd ../Shared/macos-setup
     ansible-playbook user_playbook.yaml -i inventory -l localhost -kK

Usage:

	zsh -c "$(curl -fsSL 'https://raw.githubusercontent.com/jncl/macos-setup/master/bootstrap.sh')"
