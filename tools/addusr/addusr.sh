#!/usr/bin/env bash
set -e
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
git clone git@github.com:hackclub/tilde.git || exit 1
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
nixos-rebuild build --flake . || exit 2
sudo ./result/bin/switch-to-configuration switch|| exit 2
popd #/tmp
pushd /srv/pub

pushd www
mkmod "${NEW_USER}" 755 "${NEW_USER}" users
popd
pushd gmi
mkmod "/srv/gmi/pub/${NEW_USER}" 755 "${NEW_USER}" users
sudo ln -s "/srv/gmi/pub/${NEW_USER}" "${NEW_USER}"

#mkmod "${NEW_USER}" 755 "${NEW_USER}" users
#pushd "${NEW_USER}"

#mkmod www 755 "${NEW_USER}" users
#mkmod "/srv/gmi/pub/${NEW_USER}" 755 "${NEW_USER}" users

#sudo ln -s "/srv/gmi/pub/${NEW_USER}" gmi

#sudo chown -R "${NEW_USER}" "/srv/pub/${NEW_USER}"
#sudo chgrp -R users "/srv/pub/${NEW_USER}"

popd # /tmp
echo rm -rf tilde
echo exec newusersetup | sudo tee /home/"${NEW_USER}"/.bash_profile >/dev/null
sudo chown "${NEW_USER}" /home/"${NEW_USER}"/.bash_profile 
sudo chgrp users /home/"${NEW_USER}"/.bash_profile  
sudo chmod 755 /home/"${NEW_USER}"/.bash_profile  
popd
