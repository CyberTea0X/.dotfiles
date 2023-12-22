# start sync service
sudo systemctl start syncthing@$USER.service
# autostart
sudo systemctl enable syncthing@$USER.service
