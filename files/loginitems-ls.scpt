#!/usr/bin/env osascript

# copied from here: https://github.com/OJFord/loginitems/blob/master/loginitems-ls

on run (argv)
    tell application "System Events"
        get the properties of every login item
    end tell
end run
