#!/usr/bin/env bash
set -ex
function usage { 
   printf "usage: %s username fullname ssh_key" "$0"
   exit 1
}
function mkmod {
   if [ "$#" -ne "4" ]; then
      echo "usage: mkmod name perm usr grp"
      echo "this is an internal error"
      exit 1;
   fi
   sudo mkdir "$1"
   sudo chmod "$2" "$1"
   sudo chown -R "$1" "$3"
   sudo chgrp -R "$1" "$4"
}

USER="$1"
NAME="$2"
KEY="$3"
if [ -z "$USER" ] || [ -z "$NAME" ] || [ -z "$KEY" ]; then
   usage
fi
pushd /tmp
git clone https://github.com/hackclub/tilde || exit 1
pushd /tmp/tilde
pushd users #/tmp/tilde/users
# we are in /tmp/tilde/users
cat > "${USER}.nix" << EOF
{ pkgs, ... }:
{
   users.users."${USER}" = {
    description = "${NAME}";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "${KEY}"
    ];
    extraGroups = [ "tty" ];
  };
}
EOF

USERS="$(find . -name '*.nix' -type f -! -name "default.nix" | uniq | sort)"
cat > default.nix << EOF
{ ... }:
{
   imports = [
      ${USERS}
   ];
}
EOF
popd # /tmp/tilde
git add . || exit 2
git commit -m "Automated addition of ${USER}" || exit 2
git push origin main || exit 2
sudo nix-collect-garbage || exit 2
sudo nixos-rebuild switch --flake github:hackclub/tilde/main || exit 2
popd #/tmp
pushd /srv/pub
mkmod "${USER}" 744 "${USER}" users
pushd "${USER}"

mkmod www 744 "${USER}" users
mkmod "/srv/gmi/pub/${USER}" 744 "${USER}" users

sudo ln -s "/srv/gmi/pub/${USER}" gmi

sudo chown -R "${USER}" "/srv/pub/${USER}"
sudo chgrp -R users "/srv/pub/users"

popd # /tmp
echo rm -rf tilde
pushd "/home/${USER}"
echo exec newusersetup | sudo tee ~/.bashrc >/dev/null
popd
popd
