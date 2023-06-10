#!/usr/bin/env osascript

# copied from here: https://github.com/OJFord/loginitems/blob/master/loginitems-add

on run (argv)
    set iname to (item 1 of argv)
    set ipath to (item 2 of argv)
    set ihide to (item 3 of argv)
	set ikind to (item 4 of argv)
    tell application "System Events"
        if login item iname exists then
			return "login item exists"
		else
            make new login item at end with properties {name:iname, path:ipath, kind:ikind, hidden:ihide}
        end if
    end tell
end run
