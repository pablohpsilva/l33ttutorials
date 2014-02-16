#!/bin/bash/
echo "Rewriting   /etc/default/keyboard   file"

echo '# KEYBOARD CONFIGURATION FILE''\n\n''# Consult the keyboard(5) manual page''\n\n''XKBMODEL="pc105"''\n''XKBLAYOUT="us"''\n''XKBVARIANT="altgr-intl"''\n''XKBOPTIONS=""''\n\n''BACKSPACE="guess"' > /etc/default/keyboard
