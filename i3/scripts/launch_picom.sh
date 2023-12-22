#!/usr/bin/env sh

pkill picom && sleep 1
picom --config ~/.config/picom/picom.conf
