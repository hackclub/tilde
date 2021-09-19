#!/usr/bin/env bash
set -e
if [[ "$#" -ne 3 ]]; then
    echo "Usage: $0 username real_name ssh_key"
    exit 1
fi
addusr "$1" "$2" "$3"
if [[ -z "$(cut -d: -f1 < /etc/passwd | grep $1)" ]]; then
    echo "$1: no such user"
    exit 1
fi
mkdir -p "/srv/pub/$1"/{www,gmi}
echo exec newusersetup >> /home/$1/.bashrc

