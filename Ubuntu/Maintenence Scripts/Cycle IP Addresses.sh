sudo ip address flush dev eth0
sudo dhclient -4 eth0
sudo ip address flush dev wlan0
sudo dhclient -4 wlan0