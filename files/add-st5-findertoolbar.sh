#!/usr/bin/env zsh

# script from here: https://apple.stackexchange.com/questions/197990/add-item-to-finder-toolbar-with-terminal
# with alterations to work on macOS Ventura and handle a different position value

plb=/usr/libexec/PlistBuddy
PLIST=~/Library/Preferences/com.apple.finder.plist
APP=/Applications/SublimeText.app
POSITION=1
ITEMIDS=($($plb -c "Print ':NSToolbar Configuration Browser:TB Default Item Identifiers'" $PLIST 2>/dev/null | sed '1d; $d'))
ITEMS=($($plb -c "Print ':NSToolbar Configuration Browser:TB Item Plists'" $PLIST 2>/dev/null | sed '1d; $d'))

[[ ${1} == "-t" ]] && echo "[${#ITEMIDS[@]}], [${#ITEMS[@]}]"

if [[ ${#ITEMIDS[@]} -gt 0 ]]; then
	$plb -c "Delete ':NSToolbar Configuration Browser:TB Item Identifiers'" $PLIST 2>/dev/null
else
	ITEMIDS=(
	    "com.apple.finder.BACK"
	    "com.apple.finder.SWCH"
	    NSToolbarSpaceItem
	    "com.apple.finder.ARNG"
	    "com.apple.finder.SHAR"
	    "com.apple.finder.LABL"
	    "com.apple.finder.ACTN"
	    NSToolbarSpaceItem
	    "com.apple.finder.SRCH"
	)
fi

[[ ${1} == "-t" ]] && echo "#2 [${#ITEMIDS[@]}], [${#ITEMS[@]}]"

if [[ ${#ITEMS[@]} -gt 0 ]]; then
	$plb -c "Delete ':NSToolbar Configuration Browser:TB Item Plists'" $PLIST
fi

$plb -c "Add ':NSToolbar Configuration Browser:TB Item Identifiers' array" $PLIST
i=0
for ITEM in $ITEMIDS
do
	[[ ${1} == "-t" ]] && echo "[$i] [$ITEM]"
    if [[ $i -eq $POSITION ]]; then
		((i++))
 	fi
	$plb -c "Add ':NSToolbar Configuration Browser:TB Item Identifiers:$i' string $ITEM" $PLIST
	((i++))
done

$plb -c "Add ':NSToolbar Configuration Browser:TB Item Plists:$POSITION:_CFURLString' string 'file://$APP/'" $PLIST
$plb -c "Add ':NSToolbar Configuration Browser:TB Item Plists:$POSITION:_CFURLStringType' integer 15" $PLIST
$plb -c "Add ':NSToolbar Configuration Browser:TB Item Identifiers:$POSITION' string 'com.apple.finder.loc '" $PLIST

# reload finder to apply changes
killall -HUP Finder
