#!/usr/bin/env bash
set -ex
function usage { 
   printf "usage: %s username fullname ssh_key" "$0"
   exit 1
}
USER="$1"
NAME="$2"
KEY="$3"
if [ -z "$USER" ] || [ -z "$NAME" ] || [ -z "$KEY" ]; then
   usage
fi
pushd /tmp
git clone https://github.com/hackclub/tilde
pushd /tmp/tilde
pushd users
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
popd
echo Gonna rebuild here
git add .
git commit -m "Automated addition of ${USER}"
git push origin main
sudo nix-collect-garbage
sudo nixos-rebuild switch --flake github:hackclub/tilde/main
popd
pwd
dirs
rm -rf tilde
popd
