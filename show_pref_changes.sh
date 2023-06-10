#!/usr/bin/env bash

echo "==> ~/Library/Preferences file changes"
ls -t ~/Library/Preferences | head -n 5
echo "==> ~/Library/Preferences/ByHost file changes"
ls -t ~/Library/Preferences/ByHost | head -n 5
echo "==> /Library/Preferences file changes"
ls -t /Library/Preferences | head -n 5
echo "==> /Library/Preferences/SystemConfiguration file changes"
ls -t /Library/Preferences/SystemConfiguration | head -n 5
