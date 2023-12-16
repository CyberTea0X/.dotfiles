#!/usr/bin/env sh

pkill polybar && sleep 1
polybar example -c ~/.config/polybar/config.ini &
