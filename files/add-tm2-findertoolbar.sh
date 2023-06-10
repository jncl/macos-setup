#!/usr/bin/env zsh

# script from here: https://apple.stackexchange.com/questions/197990/add-item-to-finder-toolbar-with-terminal

plb=/usr/libexec/PlistBuddy
PLIST=~/Library/Preferences/com.apple.finder.plist
APP=/Applications/TextMate.app
POSITION=1
ITEMIDS=($($plb -c "Print 'NSToolbar Configuration Browser:TB Default Item Identifiers'" $PLIST | sed '1d; $d'))
ITEMS=($($plb -c "Print 'NSToolbar Configuration Browser:TB Item Plists'" $PLIST | sed '1d; $d'))

$plb -c "Delete 'NSToolbar Configuration Browser:TB Item Identifiers'" $PLIST
if [ ${#ITEMS[@]} > 0 ]; then
	$plb -c "Delete 'NSToolbar Configuration Browser:TB Item Plists'" $PLIST
fi

$plb -c "Add 'NSToolbar Configuration Browser:TB Item Identifiers' array" $PLIST
i=0
for ITEM in $ITEMIDS
do
	if [[ $i -eq $POSITION ]]; then
		((i++))
	fi
	$plb -c "Add 'NSToolbar Configuration Browser:TB Item Identifiers:$i' string $ITEM" $PLIST
	((i++))
done

$plb -c "Add 'NSToolbar Configuration Browser:TB Item Plists:$POSITION:_CFURLString' string 'file://$APP/'" $PLIST
$plb -c "Add 'NSToolbar Configuration Browser:TB Item Plists:$POSITION:_CFURLStringType' integer 15" $PLIST
$plb -c "Add 'NSToolbar Configuration Browser:TB Item Identifiers:$POSITION' string 'com.apple.finder.loc '" $PLIST

# reload finder to apply changes
killall -HUP Finder
