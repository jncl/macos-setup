#!/usr/bin/env osascript

# copied from here: https://github.com/OJFord/loginitems/blob/master/loginitems-rm

on run (argv)
    set iname to (item 1 of argv)
    tell application "System Events"
        if login item iname exists then
            delete login item iname
			return "login item " & iname & " deleted"
        end if
    end tell
end run
