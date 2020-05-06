sudo bash -c "echo 'start_x=1' >> /boot/config.txt"
sudo bash -c "echo 'gpu_mem=128' >> /boot/config.txt"
#
cd /usr/src/
git clone https://github.com/raspberrypi/userland.git
cd userland
./buildme
touch ~/.bash_aliases
echo -e 'PATH=$PATH:/opt/vc/bin\nexport PATH' >> ~/.bash_aliases
echo -e 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/vc/lib\nexport LD_LIBRARY_PATH' >> ~/.bash_aliases
source ~/.bashrc
ldconfig
#
echo 'SUBSYSTEM==\"vchiq\",GROUP=\"video\",MODE=\"0660\"' > /etc/udev/rules.d/10-vchiq-permissions.rules
usermod -a -G video ubuntu