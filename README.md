# macos-setup

## Install
The easiest way to install is to follow the following steps:

1. Make sure you have signed into the Mac App Store.  This makes mas easier to deal with
2. Install Apples's command line tools
3. Upgrade Pip to 20.3 or later
4. Install Ansible after upgrading pip to fix cryptography issue
5. Change directory
6. Clone the Repository
7. Change into the repo directory
8. Install the requirements
9. Update roles/geerlingguy.mas/tasks/main.yml and prefix mas with '/usr/local/bin/'
10. Run the osascript command to account for sandboxing ???
11. Run the Admin playbook
12. Run the User playbook

Commands:

     xcode-select --install
     sudo -H pip3 install -U pip
     sudo -H pip3 install -U ansible
     cd ../Shared
     git clone https://github.com/jncl/macos-setup
     cd macos-setup
     ansible-galaxy install -r requirements.yml
	 sed -i "" 's|: mas |: /usr/local/bin/mas |g' roles/geerlingguy.mas/tasks/main.yml
     osascript -e 'tell application "Finder"' -e 'set _b to bounds of window of desktop' -e 'end tell'
     ansible-playbook admin_playbook.yml -i inventory -l admin
     ansible-playbook user_playbook.yml -i inventory -l user
