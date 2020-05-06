# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
. ~/.bash/.bash_profile
echo "Loading ~/.profile";
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases
fi
if [ -f ~/.bash/.bash_install ]; then
    . ~/.bash/.bash_install
fi

printpath() {
  echo $(pwd)
}

listening() {
  if [ $# -eq 0 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P
  elif [ $# -eq 1 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
  else
    echo "Usage: listening [pattern]"
  fi
}

findPort() {
  lsof -n -i4TCP:$1 | grep LISTEN
  lsof -n -iTCP:$1 | grep LISTEN
  lsof -n -i:$1 | grep LISTEN
}

networking-lo0-add-alias() {
  sudo ifconfig lo0 alias 172.16.222.111
}

run-as-root(){
    sudo -i
}

setup-brew(){
    echo 'export PATH="/home/marcus@sorafamily.com/.linuxbrew/bin:$PATH"' >>~/.bash_profile
    echo 'export MANPATH="/home/marcus@sorafamily.com/.linuxbrew/share/man:$MANPATH"' >>~/.bash_profile
    echo 'export INFOPATH="/home/marcus@sorafamily.com/.linuxbrew/share/info:$INFOPATH"' >>~/.bash_profile
    PATH="/home/marcus@sorafamily.com/.linuxbrew/bin:$PATH"
    brew install gcc
}
setup-gcc(){
#isl@0.18 is keg-only, which means it was not symlinked into /home/marcus@sorafamily.com/.linuxbrew, because this is an alternate version of another formula.
#For compilers to find isl@0.18 you may need to set:
echo 'export LDFLAGS="-L/home/marcus@sorafamily.com/.linuxbrew/opt/isl@0.18/lib"' >>~/.bash_profile
  export LDFLAGS="-L/home/marcus@sorafamily.com/.linuxbrew/opt/isl@0.18/lib"
echo 'export CPPFLAGS="-I/home/marcus@sorafamily.com/.linuxbrew/opt/isl@0.18/include"' >>~/.bash_profile
  export CPPFLAGS="-I/home/marcus@sorafamily.com/.linuxbrew/opt/isl@0.18/include"
#For pkg-config to find isl@0.18 you may need to set:
echo 'export PKG_CONFIG_PATH="/home/marcus@sorafamily.com/.linuxbrew/opt/isl@0.18/lib/pkgconfig"' >>~/.bash_profile
  export PKG_CONFIG_PATH="/home/marcus@sorafamily.com/.linuxbrew/opt/isl@0.18/lib/pkgconfig"
}

list-alias(){
    alias
}

open-current-folder-as-sudo(){
    #ubuntu
    sudo nautilis
}

open-current-folder-as-sudo-in-code(){
    if [ ! -d "$HOME/.vscode-super-user-data" ] ; 
    then 
        mkdir -p "$HOME/.vscode-super-user-data"
    fi
    sudo-code .
}

test(){
    if [ $# -eq 0 ]
     then 
        echo "None"
     else
        echo $#
        echo $*
    fi
}

sudo-code(){
    sudo code $* --user-data-dir ~/.vscode-superuser-data
}

restart-all-websites(){
    restart-nginx
    #restart-nagios
}


restart-nginx(){
    systemctl restart nginx.service
}


## Auto Installs
install-everything(){
    install-keepass
}

install-keepass(){
    sudo apt install keepassxc
}

install-python3(){
    sudo apt-get install python3
}

install-hyperv-extensions(){
    sudo apt-get install linux-image-extra-virtual
    sudo-code /etc/default/grub
    # https://superuser.com/a/782046
}

install-ldap-services-step-1(){
    #Validate Network is correct for domain controller expected.
    #cat /etc/netplan/60-cloud-init.yaml
    #Package Installation
    sudo apt update && apt upgrade
    sudo apt install -y realmd sssd-tools libnss-sss krb5-user adcli samba-common-bin
    sudo-code /etc/krb5.conf /etc/systemd/timesyncd.conf
}

install-ldap-services-step-2(){
    sudo timedatectl set-ntp true 
    sudo systemctl restart systemd-timesyncd.service
    sudo timedatectl --adjust-system-clock
    sudo-code /etc/relmd.conf
}

install-ldap-services-step-3(){
    pam-auth-update
    realm discover -v sorafamily.com
}

install-ldap-services-step-4(){
    sudo realm join --verbose --user=Marcus --computer-ou="OU=Web Servers,OU=Servers,OU=Computers,OU=Work,DC=sorafamily,DC=com" sorafamily.com --install=/
    sudo-code /etc/sssd/sssd.conf
}

install-ldap-services-step-5(){
    cd
}