#!/bin/bash
rofi \
    -show combi -show-icons \
    -run-list-command ". ~/.dotfiles/i3/scripts/alias.sh" \
    -run-command "/bin/bash -i -c '{cmd}'" -rnow
