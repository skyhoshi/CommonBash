# https://www.raspbian.org/RaspbianRepository
# File
# /etc/apt/sources.list
# Should contain the following lines:
deb http://archive.raspbian.org/raspbian wheezy main contrib non-free
deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free
# Raspbian public key can be stored into your apt-get keyring
wget https://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -