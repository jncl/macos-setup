#!/usr/bin/env osascript

# based upon code from here: http://macosxautomation.com/applescript/features/system-prefs.html

on run (argv)
    set iPic to (item 1 of argv)
    tell application "System Events"
		set the picture path of current user to iPic
		get the properties of current user
    end tell
end run
