#!/bin/bash
if [ -z "$1" ]; then
    echo ERROR:
    echo
    echo "-Wrong arguments supplied. Supply email: {./setup_githup_ssh.sh example@example.com}"
    echo "-If you want to change the default key route, supply the email and the key route: {./setup_githup_ssh.sh example@example.com ~/expl_directory/expl_keyname}"
    exit 1
fi

if [ ! -z "$2" ]; then
    ssh-keygen -t ed25519 -C $1 -f $2
    eval "$(ssh-agent -s)"
    touch ~/.ssh/config
    ssh-add $2
    echo Add the following key to GitHub:
    cat $2.pub
    exit 0
  else
    ssh-keygen -t ed25519 -C $1 -f ~/.ssh/id_ed25519
    eval "$(ssh-agent -s)"
    touch ~/.ssh/config
    ssh-add ~/.ssh/id_ed25519
    echo Add the following key to GitHub:
    cat ~/.ssh/id_ed25519.pub
    exit 0
fi
