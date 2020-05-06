# grep -B1 -i '^%sudo' /etc/sudoers
setupNewUser(){
    sudo adduser DoorbellPi001 --disabled-login --gecos '' --add_extra_groups
    ###
    sudo usermod -a -G adm,dialout,cdrom,floppy,sudo,audio,dip,video,plugdev,netdev,lxd,bluetooth doorbellpi001
    ###
}
# sudo usermod -a -G groupName DoorbellPi001
# adm:x:4:syslog,ubuntu
# dialout:x:20:ubuntu
# cdrom:x:24:ubuntu
# floppy:x:25:ubuntu
# sudo:x:27:ubuntu
# audio:x:29:ubuntu
# dip:x:30:ubuntu
# video:x:44:ubuntu
# plugdev:x:46:ubuntu
# netdev:x:114:ubuntu
# lxd:x:117:ubuntu
# bluetooth:x:118:


# adm
# dialout
# cdrom
# floppy
# sudo
# audio
# dip
# video
# plugdev
# netdev
# lxd
# bluetooth
