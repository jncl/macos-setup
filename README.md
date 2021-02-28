# macos-setup

## Install
The easiest way to install is to follow the following steps:

1. Make sure you have signed into the Mac App Store.  This makes mas easier to deal with
2. Install Apples's command line tools: `xcode-select --install`
3. Upgrade Pip to 20.3 or later: `sudo -H pip3 install -U pip ansible`
4. Change directory `cd /Users/Shared`
5. Clone the Repository: `git clone https://github.com/jncl/macos-setup`
6. Change Directories into the repo: `cd macos-setup`
7. Update the requirements file: `ansible-galaxy install -r requirements.yml`
8. Update geerlingguy.mas/tasks/main.yml and prefix mas with '/usr/local/bin/'
9. Run the osascript command to account for sandboxing ` osascript -e 'tell application "Finder"' -e 'set _b to bounds of window of desktop' -e 'end tell'`
10. Run the Playbook: `ansible-playbook admin_playbook.yml -i inventory -K -l admin`
11. Run the Playbook: `ansible-playbook user_playbook.yml -i inventory -K -l user`

Commands:

     xcode-select --install
     sudo -H pip3 install -U pip ansible
     cd /Users/Shared
     git clone https://github.com/jncl/macos-setup
     cd macos-setup
     ansible-galaxy install -r requirements.yml
	 sed -i 's/ mas / \/usr\/local\/bin\/mas /g'
     osascript -e 'tell application "Finder"' -e 'set _b to bounds of window of desktop' -e 'end tell'
     ansible-playbook admin_playbook.yml -i inventory -K -l admin
     ansible-playbook user_playbook.yml -i inventory -K -l user
