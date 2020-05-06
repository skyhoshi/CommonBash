#!/usr/local/bin/bash
# Bash 4 / ksh93
echo "Loading Bash_Profile"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
ONEDRIVESCRIPTSBASH=$HOME/OneDrive/Scripts/bash/mloma-mke01
[ -f $ONEDRIVESCRIPTSBASH/.bash_profile_loader ] && . $ONEDRIVESCRIPTSBASH/.bash_profile_loader


alias drm="docker rm"
alias dps="docker ps"
alias ls="ls -aG"
alias get="git"
alias scoop="brew"
############################
## Bash To CMD / Powershell Related
############################
reload() {
  . ~/.bash_profile
}

dir() {
  ls
}

cls() {
  clear
}

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


############################
##AUTORUNS
############################
cls




