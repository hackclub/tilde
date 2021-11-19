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
   sudo chown -R "$3" "$1"
   sudo chgrp -R "$4" "$1"
}

NEW_USER="$1"
NAME="$2"
KEY="$3"
if [ -z "$NEW_USER" ] || [ -z "$NAME" ] || [ -z "$KEY" ]; then
   usage
fi
pushd /tmp
git clone https://github.com/hackclub/tilde || exit 1
pushd /tmp/tilde
pushd users #/tmp/tilde/users
# we are in /tmp/tilde/users
cat > "${NEW_USER}.nix" << EOF
{ pkgs, ... }:
{
   users.users."${NEW_USER}" = {
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

NEW_USERS="$(find . -name '*.nix' -type f -! -name "default.nix" | uniq | sort)"
cat > default.nix << EOF
{ ... }:
{
   imports = [
      ${NEW_USERS}
   ];
}
EOF
popd # /tmp/tilde
git add . || exit 2
git commit -m "Automated addition of ${NEW_USER}" || exit 2
git push origin main || exit 2
sudo nix-collect-garbage || exit 2
sudo nixos-rebuild switch --flake github:hackclub/tilde/main || exit 2
popd #/tmp
pushd /srv/pub
mkmod "${NEW_USER}" 755 "${NEW_USER}" users
pushd "${NEW_USER}"

mkmod www 755 "${NEW_USER}" users
mkmod "/srv/gmi/pub/${NEW_USER}" 755 "${NEW_USER}" users

sudo ln -s "/srv/gmi/pub/${NEW_USER}" gmi

sudo chown -R "${NEW_USER}" "/srv/pub/${NEW_USER}"
sudo chgrp -R users "/srv/pub/${NEW_USER}"

popd # /tmp
echo rm -rf tilde
echo exec newusersetup | sudo tee /home/"${NEW_USER}"/.bashrc >/dev/null
sudo chown "${NEW_USER}" /home/"${NEW_USER}"/.bashrc 
sudo chgrp users /home/"${NEW_USER}"/.bashrc  
sudo chmod 755 /home/"${NEW_USER}"/.bashrc  
popd
